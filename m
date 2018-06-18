Return-Path: <asselsm@gmail.com>
Received: from mail-yw0-f196.google.com (mail-yw0-f196.google.com
	[209.85.161.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3CA9074FE8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2018 18:03:00 +0000 (UTC)
Received: by mail-yw0-f196.google.com with SMTP id v131-v6so5956579ywg.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2018 11:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+pt3EC4I9Jc8EBIYPnDTFBFueoOPSxlRRixc9Y2+ZU0=;
	b=toUBU1VeJGUV+VGT+kYWqpd/7YD2W+oLFkOUszCD9NGcvAttBUO1bwfw8p+3CRDgSb
	V8Yq0pC3CdNDzK/A3C9dGWYUep8A6OtKsUGd4rnBJ5AGsJIauUcI9SKrWbRZUbr94m7M
	l+A6glCKigNTJ1exrdKz0wJmhUqM6DnPIquqcOmoOsU+v20ZDKpXfHsRbdVMQNisxrfw
	vEAE0n6lvk2o8KiDRms9n4GJe28+qq4dLi06sOKBZeoWHf/m7Uf3nozGpNZHS9x21Clo
	cXep+sdfQYtRM7/WIEPhWXShPvad6Xdf3VgORBjuRTBsq4hVQIPB6OfRrHqQd0YLlN5s
	1o+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=+pt3EC4I9Jc8EBIYPnDTFBFueoOPSxlRRixc9Y2+ZU0=;
	b=qvwhinuCFnSl2JUmEJbWqJQ3hg1bPcc6ARscNX802Qj412lZNTuV/fFi54iX5XT/wc
	kaUNiYsOJNAgF5Qhq0wqrXIioUefP3IcsdmWmvAqV9/xtCUlj5s/pD9Dfg1PRtW3S88T
	X5ncKEDrfZ1h9r7GgLh9OJyoCBulgrcdQ9L45nK/o/dorhSR1yoj2uUc/O0MNuiXeaXU
	YO9n+pjjz09oTm5WEXyHSLSYJVyAe9mwHgga+cbT0QbmZrdN7eBZ3J9maAPTp/u9ymHH
	vjdVv1YFGqhicJ8Bam+ZvQgk/A3o3mFJWX6Pxmg6PWqxcuF2u/YOY3zVRL2aMgdLpOMM
	MdPQ==
X-Gm-Message-State: APt69E0snxHRa4mAUwFnkArP56lYnpKUWhwXslGV4Zco3CM9zNbRCFGk
	u+WF3Aq3hhsjtOLV3KaDgEAk0lpvVfDjPJ3FFcw=
X-Google-Smtp-Source: ADUXVKJaFgjLFnQXeLKOyffr64YUMxjhAbXBLfeRC7cPmf1BRejjsoPeKnwUcd4TdP5P5H7clO95YdgGHuKtyawyEW4=
X-Received: by 2002:a81:2c56:: with SMTP id
	s83-v6mr6481688yws.387.1529344981080; 
	Mon, 18 Jun 2018 11:03:01 -0700 (PDT)
MIME-Version: 1.0
Reply-To: mark.asselstine@windriver.com
Sender: asselsm@gmail.com
Received: by 2002:a25:bf83:0:0:0:0:0 with HTTP; Mon, 18 Jun 2018 11:03:00
	-0700 (PDT)
In-Reply-To: <CAMKF1sowdJaFO3CH8d7wRtgPKxoc5PEYESQU3w0oHYAVOsq4og@mail.gmail.com>
References: <1529340661-6337-1-git-send-email-mark.asselstine@windriver.com>
	<CAMKF1sowdJaFO3CH8d7wRtgPKxoc5PEYESQU3w0oHYAVOsq4og@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Mon, 18 Jun 2018 14:03:00 -0400
X-Google-Sender-Auth: nkZTdo6pqZFv2i13Z_x_xx14Owc
Message-ID: <CAPuovELz+L+8keBVWYCjFnWPSGPoTf5_X_TZpyKuGdf9bea1fg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH] thunar: fix QA issue 'installed-vs-shipped'
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
X-List-Received-Date: Mon, 18 Jun 2018 18:03:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 18, 2018 at 1:51 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Mon, Jun 18, 2018 at 9:51 AM Mark Asselstine
> <mark.asselstine@windriver.com> wrote:
>>
>> Since commit eb0fe21c1535 [thunar: upgrade 1.6.15 -> 1.8.0] we see a
>> QA Error/Warning regarding files 'installed-vs-shipped':
>>
>>     ERROR: QA Issue: thunar: Files/directories were installed but not
>>     shipped in any package:
>>       /usr/lib
>>       /usr/lib/systemd
>>       /usr/lib/systemd/user
>>       /usr/lib/systemd/user/thunar.service
>>
>
> perhaps this should be moved to /lib/systemd/system

Possibly but really I had to go under the assumption that the folks
that came before me and created the recipe and completed version bumps
have tested it in its current location (which is a valid location for
systemd service files by the way). So my intention was to address the
QA issue and not change the overall behavior of the recipe.

MarkA

>
>> Correct the path to the systemd service file to match what we see in
>> other recipes which include "user" service files.
>>
>> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
>> ---
>>
>> This issue and patch is for master-next to match the
>> merge status of commit eb0fe21c1535.
>>
>>  meta-xfce/recipes-xfce/thunar/thunar_1.8.0.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-xfce/recipes-xfce/thunar/thunar_1.8.0.bb b/meta-xfce/recipes-xfce/thunar/thunar_1.8.0.bb
>> index f03fd63..c2f6f59 100644
>> --- a/meta-xfce/recipes-xfce/thunar/thunar_1.8.0.bb
>> +++ b/meta-xfce/recipes-xfce/thunar/thunar_1.8.0.bb
>> @@ -21,7 +21,7 @@ FILES_${PN} += " \
>>      ${libdir}/thunarx-3/* \
>>      ${libdir}/xfce4/panel/plugins/* \
>>      ${libdir}/Thunar/[Tt]hunar* \
>> -    ${libdir}/systemd \
>> +    ${systemd_user_unitdir} \
>>      ${datadir}/dbus-1 \
>>      ${datadir}/metainfo \
>>      ${datadir}/polkit-1 \
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> ________________________http://lists.openembedded.org/pipermail/openembedded-devel/2016-March/106323.html_______________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

