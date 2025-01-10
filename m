Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2294E7719E
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 13:18:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.18364.1736515104229286461
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jan 2025 05:18:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=310530b8e5=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50ADD39a008526
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 13:18:23 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 441fnkjwfa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 13:18:23 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 10 Jan 2025 05:18:22 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 10 Jan 2025 05:18:20 -0800
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-python][kirkstone][PATCH 8/9] python3-django: Fix CVE-2024-45231
Date: Fri, 10 Jan 2025 13:18:01 +0000
Message-ID: <20250110131802.2774557-9-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250110131802.2774557-1-soumya.sambu@windriver.com>
References: <20250110131802.2774557-1-soumya.sambu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Vd7c7t6gw6HlTjNqMXgZDvfYFxM4Rj6r
X-Authority-Analysis: v=2.4 cv=bJjsIO+Z c=1 sm=1 tr=0 ts=67811e1f cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=wjU5IotzqukA:10 a=VdSt8ZQiCzkA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=hEh3JUyyAAAA:8
 a=tMAj5YbfaeJLVKybV0EA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: Vd7c7t6gw6HlTjNqMXgZDvfYFxM4Rj6r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-10_06,2025-01-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 spamscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501100104
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Jan 2025 13:18:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114775

From: Soumya Sambu <soumya.sambu@windriver.com>

An issue was discovered in Django v5.1.1, v5.0.9, and v4.2.16. The
django.contrib.auth.forms.PasswordResetForm class, when used in a view
implementing password reset flows, allows remote attackers to enumerate
user e-mail addresses by sending password reset requests and observing
the outcome (only when e-mail sending is consistently failing).

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-45231

Upstream-patch:
https://github.com/django/django/commit/bf4888d317ba4506d091eeac6e8b4f1fcc731199

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../python3-django/CVE-2024-45231.patch       | 120 ++++++++++++++++++
 .../python/python3-django_2.2.28.bb           |   1 +
 2 files changed, 121 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-django/CVE-2024-45231.patch

diff --git a/meta-python/recipes-devtools/python/python3-django/CVE-2024-45231.patch b/meta-python/recipes-devtools/python/python3-django/CVE-2024-45231.patch
new file mode 100644
index 000000000..2a0925ea9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django/CVE-2024-45231.patch
@@ -0,0 +1,120 @@
+From bf4888d317ba4506d091eeac6e8b4f1fcc731199 Mon Sep 17 00:00:00 2001
+From: Natalia <124304+nessita@users.noreply.github.com>
+Date: Mon, 19 Aug 2024 14:47:38 -0300
+Subject: [PATCH] [4.2.x] Fixed CVE-2024-45231 -- Avoided server error on
+ password reset when email sending fails.
+
+On successful submission of a password reset request, an email is sent
+to the accounts known to the system. If sending this email fails (due to
+email backend misconfiguration, service provider outage, network issues,
+etc.), an attacker might exploit this by detecting which password reset
+requests succeed and which ones generate a 500 error response.
+
+Thanks to Thibaut Spriet for the report, and to Mariusz Felisiak, Adam
+Johnson, and Sarah Boyce for the reviews.
+
+CVE: CVE-2024-45231
+
+Upstream-Status: Backport [https://github.com/django/django/commit/bf4888d317ba4506d091eeac6e8b4f1fcc731199]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ django/contrib/auth/forms.py   |  9 ++++++++-
+ docs/topics/auth/default.txt   |  4 +++-
+ tests/auth_tests/test_forms.py | 21 +++++++++++++++++++++
+ tests/mail/custombackend.py    |  5 +++++
+ 4 files changed, 37 insertions(+), 2 deletions(-)
+
+diff --git a/django/contrib/auth/forms.py b/django/contrib/auth/forms.py
+index 26d3ca7..dc640a5 100644
+--- a/django/contrib/auth/forms.py
++++ b/django/contrib/auth/forms.py
+@@ -1,3 +1,4 @@
++import logging
+ import unicodedata
+
+ from django import forms
+@@ -18,6 +19,7 @@ from django.utils.text import capfirst
+ from django.utils.translation import gettext, gettext_lazy as _
+
+ UserModel = get_user_model()
++logger = logging.getLogger("django.contrib.auth")
+
+
+ def _unicode_ci_compare(s1, s2):
+@@ -264,7 +266,12 @@ class PasswordResetForm(forms.Form):
+             html_email = loader.render_to_string(html_email_template_name, context)
+             email_message.attach_alternative(html_email, 'text/html')
+
+-        email_message.send()
++        try:
++            email_message.send()
++        except Exception:
++            logger.exception(
++                "Failed to send password reset email to %s", context["user"].pk
++            )
+
+     def get_users(self, email):
+         """Given an email, return matching user(s) who should receive a reset.
+diff --git a/docs/topics/auth/default.txt b/docs/topics/auth/default.txt
+index 1af4951..6fdf700 100644
+--- a/docs/topics/auth/default.txt
++++ b/docs/topics/auth/default.txt
+@@ -1530,7 +1530,9 @@ provides several built-in forms located in :mod:`django.contrib.auth.forms`:
+     .. method:: send_mail(subject_template_name, email_template_name, context, from_email, to_email, html_email_template_name=None)
+
+         Uses the arguments to send an ``EmailMultiAlternatives``.
+-        Can be overridden to customize how the email is sent to the user.
++        Can be overridden to customize how the email is sent to the user. If
++        you choose to override this method, be mindful of handling potential
++        exceptions raised due to email sending failures.
+
+         :param subject_template_name: the template for the subject.
+         :param email_template_name: the template for the email body.
+diff --git a/tests/auth_tests/test_forms.py b/tests/auth_tests/test_forms.py
+index e73d4b8..a45fd70 100644
+--- a/tests/auth_tests/test_forms.py
++++ b/tests/auth_tests/test_forms.py
+@@ -935,6 +935,27 @@ class PasswordResetFormTest(TestDataMixin, TestCase):
+             message.get_payload(1).get_payload()
+         ))
+
++    @override_settings(EMAIL_BACKEND="mail.custombackend.FailingEmailBackend")
++    def test_save_send_email_exceptions_are_catched_and_logged(self):
++        (user, username, email) = self.create_dummy_user()
++        form = PasswordResetForm({"email": email})
++        self.assertTrue(form.is_valid())
++
++        with self.assertLogs("django.contrib.auth", level=0) as cm:
++            form.save()
++
++        self.assertEqual(len(mail.outbox), 0)
++        self.assertEqual(len(cm.output), 1)
++        errors = cm.output[0].split("\n")
++        pk = user.pk
++        self.assertEqual(
++            errors[0],
++            f"ERROR:django.contrib.auth:Failed to send password reset email to {pk}",
++        )
++        self.assertEqual(
++            errors[-1], "ValueError: FailingEmailBackend is doomed to fail."
++        )
++
+     @override_settings(AUTH_USER_MODEL='auth_tests.CustomEmailField')
+     def test_custom_email_field(self):
+         email = 'test@mail.com'
+diff --git a/tests/mail/custombackend.py b/tests/mail/custombackend.py
+index fd57777..3e161d1 100644
+--- a/tests/mail/custombackend.py
++++ b/tests/mail/custombackend.py
+@@ -13,3 +13,8 @@ class EmailBackend(BaseEmailBackend):
+         # Messages are stored in an instance variable for testing.
+         self.test_outbox.extend(email_messages)
+         return len(email_messages)
++
++
++class FailingEmailBackend(BaseEmailBackend):
++    def send_messages(self, email_messages):
++        raise ValueError("FailingEmailBackend is doomed to fail.")
+--
+2.40.0
diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
index 275a61622..4444d943c 100644
--- a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
+++ b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
@@ -22,6 +22,7 @@ SRC_URI += "file://CVE-2023-31047.patch \
             file://CVE-2024-41990.patch \
             file://CVE-2024-41991.patch \
             file://CVE-2024-45230.patch \
+            file://CVE-2024-45231.patch \
            "
 
 SRC_URI[sha256sum] = "0200b657afbf1bc08003845ddda053c7641b9b24951e52acd51f6abda33a7413"
-- 
2.40.0


