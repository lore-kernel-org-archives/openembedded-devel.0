Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id E3A3C72F06
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Apr 2017 17:14:45 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id k6so4473740wre.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Apr 2017 10:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7NWLbLRAFbJ91EVpNJ5oCYe0sfKfeSLK3PIXnG8ae6I=;
	b=gsN06GeRlh7/ghopBJSHS9fL32i4ZlgmLlUI5kufYFybC49yPolfJ3fNQWZfC6jNW8
	rrnlbz9QF/AqYrDC6MwZYhKmXm/N2kNhEsFwCyRo57+qwxx+GC0SOUp3Wtma2mv/moNA
	sAORNR6fE2OARTQvPdt26QLXWpDFf7Ms3kjLPkQ/qU+QsCGm9OcGfUMS8PHxthOx9iQZ
	H6J/WPAJE/o0c9mOyMRF5e4sI2oAH/2U6olN14AqEguKlyljlirHiOY3jy5kllBpHx/W
	8mfPEbsoUwCMIA8sZNr1QqjBSvrmYL8nbWhEHJxXgx1ew994bSC6FKmlKh1F1ZoW9wjG
	b/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7NWLbLRAFbJ91EVpNJ5oCYe0sfKfeSLK3PIXnG8ae6I=;
	b=bYzxnFdHhVOA21XBIHVwJQsHCyVOfh79W26MCwRFvEtkLp6TEQWrc3hr2S2sx90doU
	p8GnNdzysBZROBVvt4f2QtEE2Op8KkGmsRNYc3D4wkWLWoun4EBqudtCFPclEhnxtgp2
	TGPMlwv4e145roPCibfoQ5l839oax6akG6vygHJZEbJxlYR4w4z5BYJrN6s+BciIogrf
	+kqjDMgRspXhUynO0SoZalnlwCNObW59N1rk1pfgDDf086vUkpJCPGjhdlOb5ty57Uvb
	PlEzEZ4GNMxDUU8T2ZOx0R1DgOfUiJP6Vb0xxsAbv5dSzYJJkn+FgAUEHM4FSA+ey14y
	5mgQ==
X-Gm-Message-State: AFeK/H3b3i0HvnAgs8uGPaT9sJdm0Nb6JOC9ohnbKxTUMYSm+y4bBqoH
	ztA4knTP/98rbHDQzgGynuA4NwRn5g==
X-Received: by 10.28.165.145 with SMTP id o139mr20561254wme.13.1491412486238; 
	Wed, 05 Apr 2017 10:14:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.162 with HTTP; Wed, 5 Apr 2017 10:14:15 -0700 (PDT)
In-Reply-To: <CA+chaQcAuBazrqCgVBwcLspbmkT2q08JvXMmXBUjXnpjK9Teiw@mail.gmail.com>
References: <20170331164247.5052-1-raj.khem@gmail.com>
	<20170331164247.5052-37-raj.khem@gmail.com>
	<CA+chaQcAuBazrqCgVBwcLspbmkT2q08JvXMmXBUjXnpjK9Teiw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 5 Apr 2017 10:14:15 -0700
Message-ID: <CAMKF1spaKBuc4XSR+Vo9MZM9ToD+LWtW6Lk+vTtKWRGV4KLUUw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH 37/43] xarchiver: Fix build with security flags turned on
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
X-List-Received-Date: Wed, 05 Apr 2017 17:14:46 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Apr 2, 2017 at 12:16 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> ../../git/src/window.c:234:52: error: incompatible type for argument 4 of
> 'gtk_message_dialog_new'
>   dialog = gtk_message_dialog_new (window,mode,type,"%s",button,message1);
>                                                     ^~~~
>
> http://errors.yoctoproject.org/Errors/Details/138844/
>

Fixed with

https://github.com/kraj/meta-openembedded/commit/30cfd14c1a50d3f79f58dea4012d897a64082ded

>
> On Fri, Mar 31, 2017 at 6:42 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  ...formatting-string-to-printf-like-function.patch | 43
>> ++++++++++++++++++++++
>>  meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb  |  4 +-
>>  2 files changed, 46 insertions(+), 1 deletion(-)
>>  create mode 100644
>> meta-xfce/recipes-apps/xarchiver/xarchiver/0001-Add-proper-formatting-string-to-printf-like-function.patch
>>
>> diff --git
>> a/meta-xfce/recipes-apps/xarchiver/xarchiver/0001-Add-proper-formatting-string-to-printf-like-function.patch
>> b/meta-xfce/recipes-apps/xarchiver/xarchiver/0001-Add-proper-formatting-string-to-printf-like-function.patch
>> new file mode 100644
>> index 000000000..2d7eb9a5d
>> --- /dev/null
>> +++
>> b/meta-xfce/recipes-apps/xarchiver/xarchiver/0001-Add-proper-formatting-string-to-printf-like-function.patch
>> @@ -0,0 +1,43 @@
>> +From baf93ea9acf845c5455d577ac19a6f680dac3d2d Mon Sep 17 00:00:00 2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Thu, 30 Mar 2017 11:22:42 -0700
>> +Subject: [PATCH] Add proper formatting string to printf-like functions
>> +
>> +Avoids potential security holes and makes compiler happy
>> +
>> +| ../../../../../../../workspace/sources/xarchiver/src/window.c:236:72:
>> error: format string is not a string literal (potentially insecure)
>> [-Werror,-Wformat-security]
>> +|         gtk_message_dialog_format_secondary_text (GTK_MESSAGE_DIALOG
>> (dialog),message2);
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> + src/window.c | 6 +++---
>> + 1 file changed, 3 insertions(+), 3 deletions(-)
>> +
>> +diff --git a/src/window.c b/src/window.c
>> +index ca2f69f..3b10e2c 100644
>> +--- a/src/window.c
>> ++++ b/src/window.c
>> +@@ -231,9 +231,9 @@ int xa_show_message_dialog (GtkWindow *window,int
>> mode,int type,int button,const
>> + {
>> +       int response;
>> +
>> +-      dialog = gtk_message_dialog_new
>> (window,mode,type,button,message1);
>> ++      dialog = gtk_message_dialog_new
>> (window,mode,type,"%s",button,message1);
>> +       gtk_dialog_set_default_response (GTK_DIALOG
>> (dialog),GTK_RESPONSE_NO);
>> +-      gtk_message_dialog_format_secondary_text (GTK_MESSAGE_DIALOG
>> (dialog),message2);
>> ++      gtk_message_dialog_format_secondary_text (GTK_MESSAGE_DIALOG
>> (dialog),"%s",message2);
>> +       response = gtk_dialog_run (GTK_DIALOG (dialog));
>> +       gtk_widget_destroy (GTK_WIDGET (dialog));
>> +       return response;
>> +@@ -511,7 +511,7 @@ void xa_list_archive (GtkMenuItem *menuitem,gpointer
>> data)
>> +                       g_fprintf (stream,_("Comment:\n"));
>> +                       if (bp)
>> +                               g_fprintf(stream,"</b><pre>");
>> +-                      g_fprintf (stream,archive[idx]->comment->str);
>> ++                      g_fprintf
>> (stream,"%s",archive[idx]->comment->str);
>> +                       if (bp)
>> +                               g_fprintf(stream,"</pre>");
>> +                       g_fprintf (stream,"\n");
>> +--
>> +2.12.1
>> +
>> diff --git a/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb
>> b/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb
>> index ca299223d..ea34a52c1 100644
>> --- a/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb
>> +++ b/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb
>> @@ -7,7 +7,9 @@ LIC_FILES_CHKSUM =
>> "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
>>
>>  DEPENDS = "gtk+ glib-2.0 xfce4-dev-tools-native intltool-native"
>>
>> -SRC_URI = "git://github.com/schnitzeltony/xarchiver.git;branch=master"
>> +SRC_URI = "git://github.com/schnitzeltony/xarchiver.git;branch=master \
>> +
>> file://0001-Add-proper-formatting-string-to-printf-like-function.patch \
>> +           "
>>  SRCREV = "e80e90528c9aab2fe36d9078b945b44c05cc20d3"
>>  PV = "0.5.3"
>>  S = "${WORKDIR}/git"
>> --
>> 2.12.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

