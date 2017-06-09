Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 36D6E7827E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Jun 2017 08:43:21 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id i7so30356769ioe.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Jun 2017 01:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=LBzuQ1O09iIhjW1ir6qwdU4dxaUgke4BUs6kCn7LPhY=;
	b=1oEtC72qwIv0QMjVjUaQ9QCPUgVFv5jZSW6myiXeEhz9UNKeUclCGO/3mmMJBbBrEF
	t2paVmcdX8DDfvONvhZfJbz0xtaTNAvDGXKxAO0rSxFZRGlT6E2a2ffZSbNhdOq3Z4NJ
	fNfsgxo3k8i6QyLeTmWvrNlwlSCgbJmoS+V/4VvbNn3bGPZV9pLv+c4PvVrISGEY30G1
	p4jWDkU1yuVVPykeimu+0txWHhtxxKZbpgXXXz721YnMSpxnSSbmVVhKd5nWb+uPlwpr
	0k8HNT18O7L2OKFy8gLxr4+oOeBXicr4pSgKTJBMo9wxL2HArqKZ+vWsT22dG8b+JaWI
	S4/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=LBzuQ1O09iIhjW1ir6qwdU4dxaUgke4BUs6kCn7LPhY=;
	b=jqsPuu4JAP51dRog8YsuMf1DZreNDsj/kr2rkQL7zQwIgWSXDwjaZ77zZ+FBpXUhVA
	BEdb2n7HHHWvOUZJPuPidzrNNxEhQC7FPqTSB5n8zBPjktYh00Ar+I8XZnQXZxvzqYgU
	h7lI3iaSLNuVJm+4HpwOy9Zfpn7jp0/1dWB8soFWbSu2YGYZaGJMLTPzHiESIXpzEvWi
	4fjKfIxHfhGGa4NVU9ycRHWEiEyFHjMh5j8VyZgxpovR0YgfSl4CxEQAJ9oweUCvICst
	Fy8usbJv1OZ1AMGeLIWycLEDL9aNE1JMWLrHihs/rTOi1Yx1tDzmAbkN1Y86XXd+4Zg1
	G8Cw==
X-Gm-Message-State: AODbwcDEnz6tsak90a6yKxAUJTXKwJiWhquzxSdoV3aimANISFmQyzb5
	0UQaQq1h7P3IBwJl
X-Received: by 10.107.142.82 with SMTP id q79mr12534811iod.99.1496997802982;
	Fri, 09 Jun 2017 01:43:22 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8C0DE.dip0.t-ipconnect.de. [93.232.192.222])
	by smtp.gmail.com with ESMTPSA id e32sm615024itd.18.2017.06.09.01.43.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Jun 2017 01:43:22 -0700 (PDT)
Message-ID: <1496997797.30163.181.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Date: Fri, 09 Jun 2017 10:43:17 +0200
In-Reply-To: <8806ffa9be8f4516b3f29cc1be0ceaf3@XBOX02.axis.com>
References: <20170605172321.12557-1-acfoltzer@galois.com>
	<8806ffa9be8f4516b3f29cc1be0ceaf3@XBOX02.axis.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: -pie in SECURITY_CFLAGS (was: Re: [meta-oe][PATCH 1/3] meson: update Meson devtool to 0.40.1)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Jun 2017 08:43:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-06-07 at 21:44 +0000, Peter Kjellerstedt wrote:
> My guess is that the problem stems from the fact that security_flags.inc 
> adds -pie (which is a linker flag) to SECURITY_CFLAGS rather than 
> SECURITY_LDFLAGS...

I think I've seen that cause problems elsewhere when the CFLAGS came
after -shared, because then the compiler ended up trying to produce a
pie executable instead of a shared library.

Perhaps we should finally address that in security_flags.inc instead of
working around it?

Here's an untested patch which puts -pie where it belongs in the final
variables, without changing the pie/no pie API:

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index e162abeb3d9..b7b19355806 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -12,6 +12,9 @@ lcl_maybe_fortify = "${@base_conditional('DEBUG_BUILD','1','','-D_FORTIFY_SOURCE
 # Error on use of format strings that represent possible security problems
 SECURITY_STRINGFORMAT ?= "-Wformat -Wformat-security -Werror=format-security"
 
+# For history reasons and simplicity, -pie is listed here as part of CFLAGS.
+# In practice, it ends up getting used as part of LDFLAGS, as it should
+# be because it is a linker flag.
 SECURITY_CFLAGS ?= "-fstack-protector-strong -pie -fpie ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
 SECURITY_NO_PIE_CFLAGS ?= "-fstack-protector-strong ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
 
@@ -94,8 +97,8 @@ SECURITY_STRINGFORMAT_pn-busybox = ""
 SECURITY_STRINGFORMAT_pn-gcc = ""
 SECURITY_STRINGFORMAT_pn-oh-puzzles = ""
 
-TARGET_CFLAGS_append_class-target = " ${SECURITY_CFLAGS}"
-TARGET_LDFLAGS_append_class-target = " ${SECURITY_LDFLAGS}"
+TARGET_CFLAGS_append_class-target = " ${@ oe.utils.filter_out('-pie', '${SECURITY_CFLAGS}') }"
+TARGET_LDFLAGS_append_class-target = " ${@ oe.utils.filter('-pie', '${SECURITY_CFLAGS}') } ${SECURITY_LDFLAGS}"
 
 SECURITY_LDFLAGS_remove_pn-gcc-runtime = "-fstack-protector-strong"
 SECURITY_LDFLAGS_remove_pn-glibc = "-fstack-protector-strong"

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




