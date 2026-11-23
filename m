Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48368.1795411116900126878
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:18:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=JXKtu8LS;
 spf=pass (domain: mvista.com, ip: 74.125.82.182, mailfrom: hprajapati@mvista.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3282db206d3so8789395eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1795411116; x=1796015916; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nnNhsdIxJGONGvAXITY6ayQM3YgMN0YdozuqbqaWb4U=;
        b=JXKtu8LSiIirfgXppnZRT4aSVEwcDfNu8OC+ES9iUKocpux0FLUyoBUEEa6b3MWGz4
         bxz/WSWPZkDaXyRBIYPyi//+HjECyTR0gToeGLEkP/5NBmyxP1jBeIlmRwRi1Yd0zCqi
         Qln1v4cXL+v5fgkwHFPqqbhi5Qiav4JGH3kcU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411116; x=1796015916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nnNhsdIxJGONGvAXITY6ayQM3YgMN0YdozuqbqaWb4U=;
        b=SZSHc6uxE+qNPkFODRsfpRgPKmDWaKhWrNTImp1X38/qfo22DDcaAUjZ7k6IGgFSEw
         l5mDu23NQUNLtIsVdbjdFncvUL1G9yHF2GXYIBVYKG4Gt8PqLziKSsDWyi1wUrXTYWuQ
         /3FdSlRGRA8Eo10Jzip43ZTqO8YrEHPSobpuF4X/ePLfBEc/FD0prBeAnDBFGtYaKlBl
         WJfzkSRnhaBnGid+04XvPhJcKa4qsQlkRR0iQ28M1WKtujS0xvYdO+u4woRKbP3LtGBo
         ofrPUzToAIGTB21M/ir+ZhqPIqcoZOV5r7wcHk8VeX/1pcUHa+X+9/QibuZCIHOUSavM
         ZBjg==
X-Gm-Message-State: APuU4Z+tbcwlB1Dg7u69zhYGBe59D3G+2b+EQrvEsvsYzhFlP+te5+qN
	NU2U92/K2Tjw6WD1IH4p2BBruueQeDeU9RryURhAbUAmrSFZUBuI9eXhCQp2+Hl7J63SJz5BX4V
	0eRmUcXE=
X-Gm-Gg: AZFdTZfOqpk6H17n2tPZQ2ThMyg5v3T2q4pKUVcqdC8pEfjUCGcjGXALsx9sHePc5RR
	7QxnXjr1vrPMGUIWmedfHR2cr/NOEBfwVQaSvfavRRlauSljDZRbgiD9RANNIaj09vWSs0IM6Yv
	/AQplM46sbhjaFZLGx9Rdz51iOaMG/ggW3LSTOMc5zwHvvaHlhMUBoysXyr7NLfFuTDCnkgSJsZ
	tE1qkEjXet1SAGpODhSfVVbEaQPLHfuTRtdZo92+uNcADQZGn7YihWk3hHBwp1lwC1nRec1YPwW
	HVi0nH6TJPL7LoWRyVz/d5Z7NtJwzcaxe/3Swn3EmDmE77LLiWtQPj03RZg0uUuMdYtsibOKQI5
	i5nfi7i3GWS1Uo1w4DhQlovJaxcHWLMQMMC4XVqfY9c7KOYkTBr2in1Akgj+arJ4T8j00ryBaW5
	7L8E12rwTrTsorjBkr15Py33fU7lCZOIPwUlv7vGyntsOfWvJ6Hmcxv5p9lZtsnXsoxoMcKoDwF
	qrPzd5hX7bCYe/75I6CPpR1PpkdUgCEYJSpD92VaZfHhumibJJiNdbYPtBo0Uz0nXYZZq5MrOJh
	gKHpvcFYSQ0WQXhjug4/vElsRUbr3WCeix3belk3
X-Received: by 2002:a05:693c:41cf:10b0:370:a11f:dcb7 with SMTP id 5a478bee46e88-386b1067b60mr2102623eec.41.1795411116184;
        Sun, 22 Nov 2026 21:18:36 -0800 (PST)
Return-Path: <hprajapati@mvista.com>
Received: from MVIN00013.mvista.com ([43.249.234.158])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm54709673eec.3.2026.11.22.21.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:18:35 -0800 (PST)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-oe][scarthgap][PATCH 2/2] libdbi-perl: fix for CVE-2026-88816
Date: Mon, 23 Nov 2026 10:48:21 +0530
Message-ID: <20261123051821.43934-2-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261123051821.43934-1-hprajapati@mvista.com>
References: <20261123051821.43934-1-hprajapati@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:18:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132787
Content-Type: text/plain; charset="utf-8"

Pick the patch from [1], also referenced in the Debian report [2].

[1] https://github.com/perl5-dbi/dbi/commit/70962570212dc60a5428098cf2a0462ad5945851
[2] https://security-tracker.debian.org/tracker/CVE-2026-88816

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../perl/libdbi-perl/CVE-2026-88816.patch     | 59 +++++++++++++++++++
 .../perl/libdbi-perl_1.643.bb                 |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-88816.patch

diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-88816.patch b/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-88816.patch
new file mode 100644
index 0000000000..b4b0ddf32e
--- /dev/null
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-88816.patch
@@ -0,0 +1,59 @@
+From: "H.Merijn Brand - Tux" <linux@tux.freedom.nl>
+Date: Thu, 10 Sep 2026 11:26:24 +0200
+Subject: Fix FetchHashKeyName on IV/NV (CVE-2026-88816) (reported by Raj)
+
+Origin: https://github.com/perl5-dbi/dbi/commit/70962570212dc60a5428098cf2a0462ad5945851
+Bug-Debian-Security: https://security-tracker.debian.org/tracker/CVE-2026-88816
+
+Backport Changes:
+
+The changes to ChangeLog, dbixs_rev.h, t/90sql_type_cast.t and lib/DBI/Changes.pm have been
+omitted because they are not applicable to our current version.
+Therefore, these files are not included in this patch.
+
+CVE: CVE-2026-88816
+Upstream-Status: Backport [https://github.com/perl5-dbi/dbi/commit/70962570212dc60a5428098cf2a0462ad5945851]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ DBI.xs      |  2 +-
+ t/06attrs.t | 11 +++++++++++
+ 2 files changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/DBI.xs b/DBI.xs
+index 53889f0..5b770ef 100644
+--- a/DBI.xs
++++ b/DBI.xs
+@@ -5332,7 +5332,7 @@ fetchrow_hashref(sth, keyattrib=Nullch)
+     if (!keyattrib || !*keyattrib) {
+         SV *kn = DBIc_FetchHashKeyName(imp_sth);
+         if (kn && SvOK(kn))
+-            keyattrib = SvPVX(kn);
++            keyattrib = SvPV_nolen(kn); /* Also force stringification */
+         else
+             keyattrib = "NAME";
+     }
+diff --git a/t/06attrs.t b/t/06attrs.t
+index 835e7db..37dad15 100644
+--- a/t/06attrs.t
++++ b/t/06attrs.t
+@@ -328,6 +328,17 @@ check_inherited($drh, "ReadOnly", 1, 0);
+ 
+ }
+ 
++{   # CVE-2026-88816
++    my $h = DBI->connect("dbi:ExampleP:", "", "", { RaiseError => 0, PrintError => 0 });
++    $dbh->{FetchHashKeyName} = 42;
++    my $s = $dbh->prepare("select mode,size,name from .");
++    $s->execute;
++    my @err;
++    local $SIG{__DIE__} = sub { push @err => @_ };
++    eval { $s->fetchrow_hashref; };
++    like($err[0], qr{Can't use (?:attribute '42'|an undefined)}, "Invalid HashKeyName");
++}
++
+ done_testing();
+ 
+ 1;
+-- 
+2.50.1
+
diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl_1.643.bb b/meta-oe/recipes-devtools/perl/libdbi-perl_1.643.bb
index 5328d6b8bd..3072ba76f8 100644
--- a/meta-oe/recipes-devtools/perl/libdbi-perl_1.643.bb
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl_1.643.bb
@@ -20,6 +20,7 @@ SRC_URI = "http://search.cpan.org/CPAN/authors/id/T/TI/TIMB/DBI-${PV}.tar.gz \
            file://CVE-2026-14739.patch \
            file://CVE-2026-14740.patch \
            file://CVE-2026-88815.patch \
+           file://CVE-2026-88816.patch \
            "
 SRC_URI[md5sum] = "352f80b1e23769c116082a90905d7398"
 SRC_URI[sha256sum] = "8a2b993db560a2c373c174ee976a51027dd780ec766ae17620c20393d2e836fa"
-- 
2.50.1

