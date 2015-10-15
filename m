Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 35FF773232
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Oct 2015 11:54:05 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so268851808wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Oct 2015 04:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:date:message-id
	:cc:to:mime-version;
	bh=u6AmNWMBGkDt/L4KJ3MPMxHQrsF3G32k4ykHEqCUzYA=;
	b=iDxHRiJakU53ka6JhnKPUYl2XBzzDaPCJrqaMojfDA2DUt2KkhPRsAXgpY86RCMq4+
	CxQntcMyNrqCgoByEv+bOvYhKcBFX8n2tD9dTutcc2KpYZtVFqvDlDCx13V3ZSlMU/LV
	9YPlbi1F6iaTJ3dlXYhf5H9N5FqZtI0iJtw7kyhPQ/JH16nYcuGy5rpYtF4vGbOnt43u
	Ben1WVMz3OTgRMR6/lpGBL91e68mVavEd7xphuyXFfTNUqxu+idiJAihrUsuRvY0E4Te
	TihP0zgzIzJUeW2rGBOjQYnxD64WF5yViYZhrLQDoVfAZKDsrs8BwPiO+0CthwLrIeYg
	F7Uw==
X-Received: by 10.194.58.40 with SMTP id n8mr11780190wjq.134.1444910045775;
	Thu, 15 Oct 2015 04:54:05 -0700 (PDT)
Received: from ernie.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	x9sm16039374wjf.44.2015.10.15.04.54.04
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Oct 2015 04:54:05 -0700 (PDT)
From: Jens Rehsack <rehsack@gmail.com>
Date: Thu, 15 Oct 2015 13:54:04 +0200
Message-Id: <07E89AD9-AE08-4BC3-9ECD-45039C6C2125@gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Mailer: Apple Mail (2.2104)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-java][PATCH 4/6] meta-java: avoid garbadge files making noise when gitting around :)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Oct 2015 11:54:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Adding a .gitignore file ignoring the typical noise when applying =
patches,
working with common editors and so on. Based on .gitignore of =
meta-openembedded.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 .gitignore | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 .gitignore

diff --git a/.gitignore b/.gitignore
new file mode 100644
index 0000000..51a512c
--- /dev/null
+++ b/.gitignore
@@ -0,0 +1,4 @@
+*.bak
+*.orig
+*.rej
+*.swp
--=20
2.3.8 (Apple Git-58)

--=20
Jens Rehsack - rehsack@gmail.com


