Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C216C54E64
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 02:24:45 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.9736.1711419876039378573
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Mar 2024 19:24:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=BoyIAKn4;
 spf=pass (domain: mvista.com, ip: 209.85.208.172, mailfrom: vanusuri@mvista.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2d48d75ab70so72924911fa.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 19:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1711419874; x=1712024674; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pmxN1hGR33xy68fYlmuX1nZrv5lq5EXvGr0E2TgQaPU=;
        b=BoyIAKn4doENDt7cmxTXRV0sYF8lVvTyQoQLqWukpP7rv2Kh/zcQTVuOGt96JoZDzM
         W5oQltYv5fWzJC/39O9Icm8J7Kf2dI0tsVp9yu5VMzPvfCYxIpokWomt7WKiGCylfYLk
         qXZg4gqsyiinaCBJTHuWXEjRcLGDHNdWCJcpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711419874; x=1712024674;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pmxN1hGR33xy68fYlmuX1nZrv5lq5EXvGr0E2TgQaPU=;
        b=BIPYq+/UmHGy7Wj/3mSo9EwicmRy+0oNigITL4EjrC1JlxE7Z6Q6ot9PZr+mOQUCTx
         /JOlhrXa8GYl06k6qdkoYnwzWq3YRTtJe3XHsZP7GH99140IhE1KlbRktUFHPNjsd2mJ
         PCuLOn2UGJMDxhE2ch1vEHSRIeOAJNLNUO+IwIRmjbwoR90lVHBycjd0uV6Ooygc0KPJ
         IDxlTTxMBzvzIjwRzSD9ntM08MZlu5de4vlE9dLtHRUkDMeC4p2kGr9iIouaOMnAOd8j
         4SCGnzQLZKTVCOM9BBnW6/4nMk0QEDAHdKs8YX2VhmX+xqxSZiItDifUEI+qUFhaew1d
         4n3Q==
X-Gm-Message-State: AOJu0YyCgmNcwl2JLHI3oxAwb15ArtgJAMJuimJn8Mk1jDiWr3TyfDYO
	hZygnYTbzGMj4mIe4afEnPnIlUrbQdl1ShgliSAmIiwIag2YCDXPIwu7F7j47dAq1n1wjmQ0K/J
	mClsqiWCpJAo43vKObwAsa27lQIBHsml8snUWINLMMbUZ8zi9
X-Google-Smtp-Source: AGHT+IElNDY/mHevd23VKkHkDjfR8MKFGRyYWK247xYwRg29CEa46i+vH6BVBIR0oe6EzEKF4NII9DvqmKjZ2P/3xm4=
X-Received: by 2002:a2e:6a12:0:b0:2d4:51f4:dbee with SMTP id
 f18-20020a2e6a12000000b002d451f4dbeemr4830572ljc.53.1711419872832; Mon, 25
 Mar 2024 19:24:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240311013105.4884-1-vanusuri@mvista.com>
In-Reply-To: <20240311013105.4884-1-vanusuri@mvista.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Tue, 26 Mar 2024 07:54:20 +0530
Message-ID: <CANQUz1_UVa-cy=HbCM=tfZWp_UjzZeYJ883k=+vUr5ZiPHT6RA@mail.gmail.com>
Subject: Re: [oe][meta-security][kirkstone][PATCH] clamav: Fix for CVE-2024-20328
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com
Content-Type: multipart/alternative; boundary="000000000000950da0061486fdc2"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Mar 2024 02:24:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109620

--000000000000950da0061486fdc2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Armin,

Any update on this ?

Thanks & Regards,
Vijay

On Mon, Mar 11, 2024 at 7:01=E2=80=AFAM <vanusuri@mvista.com> wrote:

> From: Vijay Anusuri <vanusuri@mvista.com>
>
> Upstream-Status: Backport [
> https://github.com/Cisco-Talos/clamav/commit/fe7638287bb11419474ea3146524=
04e7e9b314b2
> ]
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  recipes-scanners/clamav/clamav_0.104.0.bb     |   1 +
>  .../clamav/files/CVE-2024-20328.patch         | 153 ++++++++++++++++++
>  2 files changed, 154 insertions(+)
>  create mode 100644 recipes-scanners/clamav/files/CVE-2024-20328.patch
>
> diff --git a/recipes-scanners/clamav/clamav_0.104.0.bb
> b/recipes-scanners/clamav/clamav_0.104.0.bb
> index 18e8329..9e6693f 100644
> --- a/recipes-scanners/clamav/clamav_0.104.0.bb
> +++ b/recipes-scanners/clamav/clamav_0.104.0.bb
> @@ -21,6 +21,7 @@ SRC_URI =3D "git://
> github.com/vrtadmin/clamav-devel;branch=3Drel/0.104;protocol=3Dhttp
>      file://headers_fixup.patch \
>      file://oe_cmake_fixup.patch \
>      file://fix_systemd_socket.patch \
> +    file://CVE-2024-20328.patch \
>  "
>  S =3D "${WORKDIR}/git"
>
> diff --git a/recipes-scanners/clamav/files/CVE-2024-20328.patch
> b/recipes-scanners/clamav/files/CVE-2024-20328.patch
> new file mode 100644
> index 0000000..2f422cf
> --- /dev/null
> +++ b/recipes-scanners/clamav/files/CVE-2024-20328.patch
> @@ -0,0 +1,153 @@
> +From fe7638287bb11419474ea314652404e7e9b314b2 Mon Sep 17 00:00:00 2001
> +From: Micah Snyder <micasnyd@cisco.com>
> +Date: Wed, 10 Jan 2024 12:09:15 -0500
> +Subject: [PATCH] ClamD: Disable VirusEvent '%f' feature, use environment
> var
> + instead
> +
> +The '%f' filename format character has been disabled and will no longer
> +be replaced with the file name, due to command injection security
> concerns.
> +Use the 'CLAM_VIRUSEVENT_FILENAME' environment variable instead.
> +
> +For the same reason, you should NOT use the environment variables in the
> +command directly, but should use it carefully from your executed script.
> +
> +Upstream-Status: Backport [
> https://github.com/Cisco-Talos/clamav/commit/fe7638287bb11419474ea3146524=
04e7e9b314b2
> ]
> +CVE: CVE-2024-20328
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + clamd/clamd_others.c                  |  8 +++++---
> + common/optparser.c                    |  2 +-
> + docs/man/clamd.conf.5.in              | 14 ++++++++++----
> + etc/clamd.conf.sample                 | 18 ++++++++++++------
> + win32/conf_examples/clamd.conf.sample | 18 ++++++++++++------
> + 5 files changed, 40 insertions(+), 20 deletions(-)
> +
> +diff --git a/clamd/clamd_others.c b/clamd/clamd_others.c
> +index 23f3b022c7..32d0701a0d 100644
> +--- a/clamd/clamd_others.c
> ++++ b/clamd/clamd_others.c
> +@@ -101,6 +101,8 @@ void virusaction(const char *filename, const char
> *virname,
> + #define VE_FILENAME "CLAM_VIRUSEVENT_FILENAME"
> + #define VE_VIRUSNAME "CLAM_VIRUSEVENT_VIRUSNAME"
> +
> ++#define FILENAME_DISABLED_MESSAGE "The filename format character has
> been disabled due to security concerns, use the 'CLAM_VIRUSEVENT_FILENAME=
'
> environment variable instead."
> ++
> + void virusaction(const char *filename, const char *virname,
> +                  const struct optstruct *opts)
> + {
> +@@ -145,7 +147,7 @@ void virusaction(const char *filename, const char
> *virname,
> +     }
> +     len =3D strlen(opt->strarg);
> +     buffer_cmd =3D
> +-        (char *)calloc(len + v * strlen(virname) + f * strlen(filename)
> + 1, sizeof(char));
> ++        (char *)calloc(len + v * strlen(virname) + f *
> strlen(FILENAME_DISABLED_MESSAGE) + 1, sizeof(char));
> +     if (!buffer_cmd) {
> +         if (path)
> +             xfree(env[0]);
> +@@ -160,8 +162,8 @@ void virusaction(const char *filename, const char
> *virname,
> +             j +=3D strlen(virname);
> +             i++;
> +         } else if (i + 1 < len && opt->strarg[i] =3D=3D '%' && opt->str=
arg[i
> + 1] =3D=3D 'f') {
> +-            strcat(buffer_cmd, filename);
> +-            j +=3D strlen(filename);
> ++            strcat(buffer_cmd, FILENAME_DISABLED_MESSAGE);
> ++            j +=3D strlen(FILENAME_DISABLED_MESSAGE);
> +             i++;
> +         } else {
> +             buffer_cmd[j++] =3D opt->strarg[i];
> +diff --git a/common/optparser.c b/common/optparser.c
> +index a7bdbee064..1be7afe867 100644
> +--- a/common/optparser.c
> ++++ b/common/optparser.c
> +@@ -333,7 +333,7 @@ const struct clam_option __clam_options[] =3D {
> +
> +     {"DisableCache", "disable-cache", 0, CLOPT_TYPE_BOOL, MATCH_BOOL, 0=
,
> NULL, 0, OPT_CLAMD | OPT_CLAMSCAN, "This option allows you to disable
> clamd's caching feature.", "no"},
> +
> +-    {"VirusEvent", NULL, 0, CLOPT_TYPE_STRING, NULL, -1, NULL, 0,
> OPT_CLAMD, "Execute a command when a virus is found. In the command strin=
g
> %v will be\nreplaced with the virus name and %f will be replaced with the
> file name.\nAdditionally, two environment variables will be defined:
> $CLAM_VIRUSEVENT_FILENAME\nand $CLAM_VIRUSEVENT_VIRUSNAME.",
> "/usr/bin/mailx -s \"ClamAV VIRUS ALERT: %v\" alert < /dev/null"},
> ++    {"VirusEvent", NULL, 0, CLOPT_TYPE_STRING, NULL, -1, NULL, 0,
> OPT_CLAMD, "Execute a command when virus is found.\nUse the following
> environment variables to identify the file and virus names:\n-
> $CLAM_VIRUSEVENT_FILENAME\n- $CLAM_VIRUSEVENT_VIRUSNAME\nIn the command
> string, '%v' will also be replaced with the virus name.\nNote: The '%f'
> filename format character has been disabled and will no longer\nbe replac=
ed
> with the file name, due to command injection security concerns.\nUse the
> 'CLAM_VIRUSEVENT_FILENAME' environment variable instead.\nFor the same
> reason, you should NOT use the environment variables in the\ncommand
> directly, but should use it carefully from your executed script.",
> "/opt/send_virus_alert_sms.sh"},
> +
> +     {"ExitOnOOM", NULL, 0, CLOPT_TYPE_BOOL, MATCH_BOOL, 0, NULL, 0,
> OPT_CLAMD, "Stop the daemon when libclamav reports an out of memory
> condition.", "yes"},
> +
> +diff --git a/docs/man/clamd.conf.5.in b/docs/man/clamd.conf.5.in
> +index 2d9748a39e..a9926533b9 100644
> +--- a/docs/man/clamd.conf.5.in
> ++++ b/docs/man/clamd.conf.5.in
> +@@ -240,10 +240,16 @@ Enable non-blocking (multi-threaded/concurrent)
> database reloads. This feature w
> + Default: yes
> + .TP
> + \fBVirusEvent COMMAND\fR
> +-Execute a command when a virus is found. In the command string %v will =
be
> +-replaced with the virus name and %f will be replaced with the file name=
.
> +-Additionally, two environment variables will be defined:
> $CLAM_VIRUSEVENT_FILENAME
> +-and $CLAM_VIRUSEVENT_VIRUSNAME.
> ++Execute a command when virus is found.
> ++Use the following environment variables to identify the file and virus
> names:
> ++- $CLAM_VIRUSEVENT_FILENAME
> ++- $CLAM_VIRUSEVENT_VIRUSNAME
> ++In the command string, '%v' will also be replaced with the virus name.
> ++Note: The '%f' filename format character has been disabled and will no
> longer
> ++be replaced with the file name, due to command injection security
> concerns.
> ++Use the 'CLAM_VIRUSEVENT_FILENAME' environment variable instead.
> ++For the same reason, you should NOT use the environment variables in th=
e
> ++command directly, but should use it carefully from your executed script=
.
> + \fR
> + .br
> + Default: disabled
> +diff --git a/etc/clamd.conf.sample b/etc/clamd.conf.sample
> +index 37fb03bf20..54738128da 100644
> +--- a/etc/clamd.conf.sample
> ++++ b/etc/clamd.conf.sample
> +@@ -209,12 +209,18 @@ Example
> + # Default: yes
> + #ConcurrentDatabaseReload no
> +
> +-# Execute a command when virus is found. In the command string %v will
> +-# be replaced with the virus name and %f will be replaced with the file
> name.
> +-# Additionally, two environment variables will be defined:
> $CLAM_VIRUSEVENT_FILENAME
> +-# and $CLAM_VIRUSEVENT_VIRUSNAME.
> +-# Default: no
> +-#VirusEvent /usr/local/bin/send_sms 123456789 "VIRUS ALERT: %v in %f"
> ++# Execute a command when virus is found.
> ++# Use the following environment variables to identify the file and viru=
s
> names:
> ++# - $CLAM_VIRUSEVENT_FILENAME
> ++# - $CLAM_VIRUSEVENT_VIRUSNAME
> ++# In the command string, '%v' will also be replaced with the virus name=
.
> ++# Note: The '%f' filename format character has been disabled and will n=
o
> longer
> ++# be replaced with the file name, due to command injection security
> concerns.
> ++# Use the 'CLAM_VIRUSEVENT_FILENAME' environment variable instead.
> ++# For the same reason, you should NOT use the environment variables in
> the
> ++# command directly, but should use it carefully from your executed
> script.
> ++# Default: no
> ++#VirusEvent /opt/send_virus_alert_sms.sh
> +
> + # Run as another user (clamd must be started by root for this option to
> work)
> + # Default: don't drop privileges
> +diff --git a/win32/conf_examples/clamd.conf.sample
> b/win32/conf_examples/clamd.conf.sample
> +index 5a8a9cfeae..a4813f99cb 100644
> +--- a/win32/conf_examples/clamd.conf.sample
> ++++ b/win32/conf_examples/clamd.conf.sample
> +@@ -182,12 +182,18 @@ TCPAddr localhost
> + # Default: yes
> + #ConcurrentDatabaseReload no
> +
> +-# Execute a command when virus is found. In the command string %v will
> +-# be replaced with the virus name and %f will be replaced with the file
> name.
> +-# Additionally, two environment variables will be defined:
> $CLAM_VIRUSEVENT_FILENAME
> +-# and $CLAM_VIRUSEVENT_VIRUSNAME.
> +-# Default: no
> +-#VirusEvent "C:\example\SendEmail.ps1" email@addresscom "VIRUS ALERT:
> %v in %f"
> ++# Execute a command when virus is found.
> ++# Use the following environment variables to identify the file and viru=
s
> names:
> ++# - $CLAM_VIRUSEVENT_FILENAME
> ++# - $CLAM_VIRUSEVENT_VIRUSNAME
> ++# In the command string, '%v' will also be replaced with the virus name=
.
> ++# Note: The '%f' filename format character has been disabled and will n=
o
> longer
> ++# be replaced with the file name, due to command injection security
> concerns.
> ++# Use the 'CLAM_VIRUSEVENT_FILENAME' environment variable instead.
> ++# For the same reason, you should NOT use the environment variables in
> the
> ++# command directly, but should use it carefully from your executed
> script.
> ++# Default: no
> ++#VirusEvent "C:\example\SendVirusAlertEmail.ps1"
> +
> + # Run as another user (clamd must be started by root for this option to
> work)
> + # Default: don't drop privileges
> --
> 2.25.1
>
>

--000000000000950da0061486fdc2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Armin,<br><br></div><div>Any update on this ?</div=
><div><br></div><div>Thanks &amp; Regards,</div><div>Vijay<br></div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon,=
 Mar 11, 2024 at 7:01=E2=80=AFAM &lt;<a href=3D"mailto:vanusuri@mvista.com"=
 target=3D"_blank">vanusuri@mvista.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">From: Vijay Anusuri &lt;<a href=3D"ma=
ilto:vanusuri@mvista.com" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
<br>
Upstream-Status: Backport [<a href=3D"https://github.com/Cisco-Talos/clamav=
/commit/fe7638287bb11419474ea314652404e7e9b314b2" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/Cisco-Talos/clamav/commit/fe7638287bb1141947=
4ea314652404e7e9b314b2</a>]<br>
<br>
Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" tar=
get=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
---<br>
=C2=A0recipes-scanners/clamav/<a href=3D"http://clamav_0.104.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">clamav_0.104.0.bb</a>=C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A01 +<br>
=C2=A0.../clamav/files/CVE-2024-20328.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 153 ++++++++++++++++++<br>
=C2=A02 files changed, 154 insertions(+)<br>
=C2=A0create mode 100644 recipes-scanners/clamav/files/CVE-2024-20328.patch=
<br>
<br>
diff --git a/recipes-scanners/clamav/<a href=3D"http://clamav_0.104.0.bb" r=
el=3D"noreferrer" target=3D"_blank">clamav_0.104.0.bb</a> b/recipes-scanner=
s/clamav/<a href=3D"http://clamav_0.104.0.bb" rel=3D"noreferrer" target=3D"=
_blank">clamav_0.104.0.bb</a><br>
index 18e8329..9e6693f 100644<br>
--- a/recipes-scanners/clamav/<a href=3D"http://clamav_0.104.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">clamav_0.104.0.bb</a><br>
+++ b/recipes-scanners/clamav/<a href=3D"http://clamav_0.104.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">clamav_0.104.0.bb</a><br>
@@ -21,6 +21,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/vrta=
dmin/clamav-devel;branch=3Drel/0.104;protocol=3Dhttp" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/vrtadmin/clamav-devel;branch=3Drel/0.104;protoco=
l=3Dhttp</a><br>
=C2=A0 =C2=A0 =C2=A0file://headers_fixup.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://oe_cmake_fixup.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://fix_systemd_socket.patch \<br>
+=C2=A0 =C2=A0 file://CVE-2024-20328.patch \<br>
=C2=A0&quot;<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
diff --git a/recipes-scanners/clamav/files/CVE-2024-20328.patch b/recipes-s=
canners/clamav/files/CVE-2024-20328.patch<br>
new file mode 100644<br>
index 0000000..2f422cf<br>
--- /dev/null<br>
+++ b/recipes-scanners/clamav/files/CVE-2024-20328.patch<br>
@@ -0,0 +1,153 @@<br>
+From fe7638287bb11419474ea314652404e7e9b314b2 Mon Sep 17 00:00:00 2001<br>
+From: Micah Snyder &lt;<a href=3D"mailto:micasnyd@cisco.com" target=3D"_bl=
ank">micasnyd@cisco.com</a>&gt;<br>
+Date: Wed, 10 Jan 2024 12:09:15 -0500<br>
+Subject: [PATCH] ClamD: Disable VirusEvent &#39;%f&#39; feature, use envir=
onment var<br>
+ instead<br>
+<br>
+The &#39;%f&#39; filename format character has been disabled and will no l=
onger<br>
+be replaced with the file name, due to command injection security concerns=
.<br>
+Use the &#39;CLAM_VIRUSEVENT_FILENAME&#39; environment variable instead.<b=
r>
+<br>
+For the same reason, you should NOT use the environment variables in the<b=
r>
+command directly, but should use it carefully from your executed script.<b=
r>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/Cisco-Talos/clama=
v/commit/fe7638287bb11419474ea314652404e7e9b314b2" rel=3D"noreferrer" targe=
t=3D"_blank">https://github.com/Cisco-Talos/clamav/commit/fe7638287bb114194=
74ea314652404e7e9b314b2</a>]<br>
+CVE: CVE-2024-20328<br>
+Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" ta=
rget=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
+---<br>
+ clamd/clamd_others.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 8 +++++---<br>
+ common/optparser.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
+ docs/man/<a href=3D"http://clamd.conf.5.in" rel=3D"noreferrer" target=3D"=
_blank">clamd.conf.5.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 | 14 ++++++++++----<br>
+ etc/clamd.conf.sample=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 18 ++++++++++++------<br>
+ win32/conf_examples/clamd.conf.sample | 18 ++++++++++++------<br>
+ 5 files changed, 40 insertions(+), 20 deletions(-)<br>
+<br>
+diff --git a/clamd/clamd_others.c b/clamd/clamd_others.c<br>
+index 23f3b022c7..32d0701a0d 100644<br>
+--- a/clamd/clamd_others.c<br>
++++ b/clamd/clamd_others.c<br>
+@@ -101,6 +101,8 @@ void virusaction(const char *filename, const char *vir=
name,<br>
+ #define VE_FILENAME &quot;CLAM_VIRUSEVENT_FILENAME&quot;<br>
+ #define VE_VIRUSNAME &quot;CLAM_VIRUSEVENT_VIRUSNAME&quot;<br>
+ <br>
++#define FILENAME_DISABLED_MESSAGE &quot;The filename format character has=
 been disabled due to security concerns, use the &#39;CLAM_VIRUSEVENT_FILEN=
AME&#39; environment variable instead.&quot;<br>
++<br>
+ void virusaction(const char *filename, const char *virname,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const struc=
t optstruct *opts)<br>
+ {<br>
+@@ -145,7 +147,7 @@ void virusaction(const char *filename, const char *vir=
name,<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0len =3D strlen(opt-&gt;strarg);<br>
+=C2=A0 =C2=A0 =C2=A0buffer_cmd =3D<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 (char *)calloc(len + v * strlen(virname) + f =
* strlen(filename) + 1, sizeof(char));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 (char *)calloc(len + v * strlen(virname) + f =
* strlen(FILENAME_DISABLED_MESSAGE) + 1, sizeof(char));<br>
+=C2=A0 =C2=A0 =C2=A0if (!buffer_cmd) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (path)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xfree(env[0]);<br>
+@@ -160,8 +162,8 @@ void virusaction(const char *filename, const char *vir=
name,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0j +=3D strlen(virname);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i++;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (i + 1 &lt; len &amp;&amp; opt=
-&gt;strarg[i] =3D=3D &#39;%&#39; &amp;&amp; opt-&gt;strarg[i + 1] =3D=3D &=
#39;f&#39;) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strcat(buffer_cmd, filename);<b=
r>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 j +=3D strlen(filename);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strcat(buffer_cmd, FILENAME_DIS=
ABLED_MESSAGE);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 j +=3D strlen(FILENAME_DISABLED=
_MESSAGE);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i++;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0buffer_cmd[j++] =3D opt-&g=
t;strarg[i];<br>
+diff --git a/common/optparser.c b/common/optparser.c<br>
+index a7bdbee064..1be7afe867 100644<br>
+--- a/common/optparser.c<br>
++++ b/common/optparser.c<br>
+@@ -333,7 +333,7 @@ const struct clam_option __clam_options[] =3D {<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0{&quot;DisableCache&quot;, &quot;disable-cache&quot;, =
0, CLOPT_TYPE_BOOL, MATCH_BOOL, 0, NULL, 0, OPT_CLAMD | OPT_CLAMSCAN, &quot=
;This option allows you to disable clamd&#39;s caching feature.&quot;, &quo=
t;no&quot;},<br>
+ <br>
+-=C2=A0 =C2=A0 {&quot;VirusEvent&quot;, NULL, 0, CLOPT_TYPE_STRING, NULL, =
-1, NULL, 0, OPT_CLAMD, &quot;Execute a command when a virus is found. In t=
he command string %v will be\nreplaced with the virus name and %f will be r=
eplaced with the file name.\nAdditionally, two environment variables will b=
e defined: $CLAM_VIRUSEVENT_FILENAME\nand $CLAM_VIRUSEVENT_VIRUSNAME.&quot;=
, &quot;/usr/bin/mailx -s \&quot;ClamAV VIRUS ALERT: %v\&quot; alert &lt; /=
dev/null&quot;},<br>
++=C2=A0 =C2=A0 {&quot;VirusEvent&quot;, NULL, 0, CLOPT_TYPE_STRING, NULL, =
-1, NULL, 0, OPT_CLAMD, &quot;Execute a command when virus is found.\nUse t=
he following environment variables to identify the file and virus names:\n-=
 $CLAM_VIRUSEVENT_FILENAME\n- $CLAM_VIRUSEVENT_VIRUSNAME\nIn the command st=
ring, &#39;%v&#39; will also be replaced with the virus name.\nNote: The &#=
39;%f&#39; filename format character has been disabled and will no longer\n=
be replaced with the file name, due to command injection security concerns.=
\nUse the &#39;CLAM_VIRUSEVENT_FILENAME&#39; environment variable instead.\=
nFor the same reason, you should NOT use the environment variables in the\n=
command directly, but should use it carefully from your executed script.&qu=
ot;, &quot;/opt/send_virus_alert_sms.sh&quot;},<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0{&quot;ExitOnOOM&quot;, NULL, 0, CLOPT_TYPE_BOOL, MATC=
H_BOOL, 0, NULL, 0, OPT_CLAMD, &quot;Stop the daemon when libclamav reports=
 an out of memory condition.&quot;, &quot;yes&quot;},<br>
+ <br>
+diff --git a/docs/man/<a href=3D"http://clamd.conf.5.in" rel=3D"noreferrer=
" target=3D"_blank">clamd.conf.5.in</a> b/docs/man/<a href=3D"http://clamd.=
conf.5.in" rel=3D"noreferrer" target=3D"_blank">clamd.conf.5.in</a><br>
+index 2d9748a39e..a9926533b9 100644<br>
+--- a/docs/man/<a href=3D"http://clamd.conf.5.in" rel=3D"noreferrer" targe=
t=3D"_blank">clamd.conf.5.in</a><br>
++++ b/docs/man/<a href=3D"http://clamd.conf.5.in" rel=3D"noreferrer" targe=
t=3D"_blank">clamd.conf.5.in</a><br>
+@@ -240,10 +240,16 @@ Enable non-blocking (multi-threaded/concurrent) data=
base reloads. This feature w<br>
+ Default: yes<br>
+ .TP<br>
+ \fBVirusEvent COMMAND\fR<br>
+-Execute a command when a virus is found. In the command string %v will be=
<br>
+-replaced with the virus name and %f will be replaced with the file name.<=
br>
+-Additionally, two environment variables will be defined: $CLAM_VIRUSEVENT=
_FILENAME<br>
+-and $CLAM_VIRUSEVENT_VIRUSNAME.<br>
++Execute a command when virus is found.<br>
++Use the following environment variables to identify the file and virus na=
mes:<br>
++- $CLAM_VIRUSEVENT_FILENAME<br>
++- $CLAM_VIRUSEVENT_VIRUSNAME<br>
++In the command string, &#39;%v&#39; will also be replaced with the virus =
name.<br>
++Note: The &#39;%f&#39; filename format character has been disabled and wi=
ll no longer<br>
++be replaced with the file name, due to command injection security concern=
s.<br>
++Use the &#39;CLAM_VIRUSEVENT_FILENAME&#39; environment variable instead.<=
br>
++For the same reason, you should NOT use the environment variables in the<=
br>
++command directly, but should use it carefully from your executed script.<=
br>
+ \fR<br>
+ .br<br>
+ Default: disabled<br>
+diff --git a/etc/clamd.conf.sample b/etc/clamd.conf.sample<br>
+index 37fb03bf20..54738128da 100644<br>
+--- a/etc/clamd.conf.sample<br>
++++ b/etc/clamd.conf.sample<br>
+@@ -209,12 +209,18 @@ Example<br>
+ # Default: yes<br>
+ #ConcurrentDatabaseReload no<br>
+ <br>
+-# Execute a command when virus is found. In the command string %v will<br=
>
+-# be replaced with the virus name and %f will be replaced with the file n=
ame.<br>
+-# Additionally, two environment variables will be defined: $CLAM_VIRUSEVE=
NT_FILENAME<br>
+-# and $CLAM_VIRUSEVENT_VIRUSNAME.<br>
+-# Default: no<br>
+-#VirusEvent /usr/local/bin/send_sms 123456789 &quot;VIRUS ALERT: %v in %f=
&quot;<br>
++# Execute a command when virus is found.<br>
++# Use the following environment variables to identify the file and virus =
names:<br>
++# - $CLAM_VIRUSEVENT_FILENAME<br>
++# - $CLAM_VIRUSEVENT_VIRUSNAME<br>
++# In the command string, &#39;%v&#39; will also be replaced with the viru=
s name.<br>
++# Note: The &#39;%f&#39; filename format character has been disabled and =
will no longer<br>
++# be replaced with the file name, due to command injection security conce=
rns.<br>
++# Use the &#39;CLAM_VIRUSEVENT_FILENAME&#39; environment variable instead=
.<br>
++# For the same reason, you should NOT use the environment variables in th=
e<br>
++# command directly, but should use it carefully from your executed script=
.<br>
++# Default: no<br>
++#VirusEvent /opt/send_virus_alert_sms.sh<br>
+ <br>
+ # Run as another user (clamd must be started by root for this option to w=
ork)<br>
+ # Default: don&#39;t drop privileges<br>
+diff --git a/win32/conf_examples/clamd.conf.sample b/win32/conf_examples/c=
lamd.conf.sample<br>
+index 5a8a9cfeae..a4813f99cb 100644<br>
+--- a/win32/conf_examples/clamd.conf.sample<br>
++++ b/win32/conf_examples/clamd.conf.sample<br>
+@@ -182,12 +182,18 @@ TCPAddr localhost<br>
+ # Default: yes<br>
+ #ConcurrentDatabaseReload no<br>
+ <br>
+-# Execute a command when virus is found. In the command string %v will<br=
>
+-# be replaced with the virus name and %f will be replaced with the file n=
ame.<br>
+-# Additionally, two environment variables will be defined: $CLAM_VIRUSEVE=
NT_FILENAME<br>
+-# and $CLAM_VIRUSEVENT_VIRUSNAME.<br>
+-# Default: no<br>
+-#VirusEvent &quot;C:\example\SendEmail.ps1&quot; email@addresscom &quot;V=
IRUS ALERT: %v in %f&quot;<br>
++# Execute a command when virus is found.<br>
++# Use the following environment variables to identify the file and virus =
names:<br>
++# - $CLAM_VIRUSEVENT_FILENAME<br>
++# - $CLAM_VIRUSEVENT_VIRUSNAME<br>
++# In the command string, &#39;%v&#39; will also be replaced with the viru=
s name.<br>
++# Note: The &#39;%f&#39; filename format character has been disabled and =
will no longer<br>
++# be replaced with the file name, due to command injection security conce=
rns.<br>
++# Use the &#39;CLAM_VIRUSEVENT_FILENAME&#39; environment variable instead=
.<br>
++# For the same reason, you should NOT use the environment variables in th=
e<br>
++# command directly, but should use it carefully from your executed script=
.<br>
++# Default: no<br>
++#VirusEvent &quot;C:\example\SendVirusAlertEmail.ps1&quot;<br>
+ <br>
+ # Run as another user (clamd must be started by root for this option to w=
ork)<br>
+ # Default: don&#39;t drop privileges<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div>

--000000000000950da0061486fdc2--

