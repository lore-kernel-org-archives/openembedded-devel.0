Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id BBB5C72F30
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 23:48:22 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id v186so155761902wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 15:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ty4NFsO3VhusBNKHdhpqzRngcXdlPuyzaO4zwQy/k9g=;
	b=qxWejDWNsxWOyqj8jcYXQzrlxuhjIDKAjjQ710avi58QP5aLxgDAWUKDyTy5ZUN4AZ
	JIzvpSi+DdMeHJg9NiL4s+upl9vASGTQttP1KDAaKGsI/LqW4qrCspYY6Lq1rh4wyanj
	DPZawEDwnPWfHcyxkZmlrwaTqmYYlN/ySmoM1xL6RXUDb5Tv6gyr3MkiN4oePbYIXgaA
	TzBqlywzzprKq+ZQ5uH7RsjfgKeuDDeR01GD3fPi2qFZgCS7ld6HcSrqBDysaa7rTnpd
	3d01dz2CYR1I2Vw8C3E1AHRqOG0zI3U5+VVo0tffgT8xPU64q0xBKzuktGIgw7CYv6oT
	J55g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ty4NFsO3VhusBNKHdhpqzRngcXdlPuyzaO4zwQy/k9g=;
	b=qpGwAX4emj87xW2K76ljzUF7p43n9UKH7fYbkkCVaAz/wYktC1Qiwx6qtduXZ5pihW
	aO22EjoSeXXTtW6Xha7ltWkA2f2HM8XHXUQDnoIdfbumuG5U+ShK4f9TiZNGKsToKR2k
	ZqIMWVFXlPlrP5pbnO8hXTcPZ7zKO+uVkrAKa2LqRedT7oMPPmimrb3LtrGmmtXR2KdC
	p6rCrUKvXz+J4HpFEz42AOLODNIqEcl/HGXnOpd0bDPjVlZdmogb7k9/1uSlt5xa289I
	MxR7dkMlJwpXFZNDaLDsz567GL7SAO2XhJzJRbszxGy2OZ5X4b+Gkbzz56nheGFwFu3j
	0j4g==
X-Gm-Message-State: AMke39mixLCEGme+VjJ/ZNToQNXnomAaZhwphN63uc08x/52WgECrewo4SQ/kyG9OvDeJcsvpQV9rVAk3jTd9Q==
X-Received: by 10.28.211.205 with SMTP id k196mr820119wmg.124.1487807303333;
	Wed, 22 Feb 2017 15:48:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.212.30 with HTTP; Wed, 22 Feb 2017 15:48:22 -0800 (PST)
In-Reply-To: <506a5e6c-36f6-7b1f-a375-24bebb57342f@linuxfoundation.org>
References: <20170222213254.GH3283@jama>
	<506a5e6c-36f6-7b1f-a375-24bebb57342f@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 23 Feb 2017 00:48:22 +0100
Message-ID: <CA+chaQe23zrLkeJ81iyWxx__=S2PDjGtTSGqm8x5KZOtMd5D_w@mail.gmail.com>
To: Michael Halstead <mhalstead@linuxfoundation.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Before you ping some older patches
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
X-List-Received-Date: Wed, 22 Feb 2017 23:48:23 -0000
Content-Type: text/plain; charset=UTF-8

Hi Michael,

thanks for quick fix.

The hook now shows error about sendmail I wasn't seeing before:

OE @ ~/meta-openembedded $ git push origin master-next
Counting objects: 78, done.
Delta compression using up to 8 threads.
Compressing objects: 100% (25/25), done.
Writing objects: 100% (78/78), 7.35 KiB | 0 bytes/s, done.
Total 78 (delta 56), reused 66 (delta 49)
remote: No sendmail executable found.  Try setting
multimailhook.sendmailCommand.
To git.openembedded.org:meta-openembedded
   eb7979113..0d27137f0  master-next -> master-next


On Thu, Feb 23, 2017 at 12:06 AM, Michael Halstead <
mhalstead@linuxfoundation.org> wrote:

> The hooks are repaired and need testing. (Bad git/config settings.) Please
> feel free to resubmit patches. Let me know if they do not appear in
> patchwork.
> I'm trying to see if I can automatically resend the missed patches and
> mark them superseded if needed. I'll update post here if it works.
>
>
>
> On 02/22/2017 01:32 PM, Martin Jansa wrote:
>
> 1) Make sure they aren't already in master (or master-next), currently
> there is only one change in master-next:
> eb7979113 netcat-openbsd: fix implicit dependency on pkg-config
>
> 2) Make sure there weren't some negative feedback comments on our change
>
> 3) Make sure the change made it to patchwork, currently there is only
> one "open" change:https://patchwork.openembedded.org/patch/137499/
>
> Be aware that the changes are usually daily marked as archived, when
> they are sorted to corresponding bundles and included in master-next
> branch for testing, as described here:http://www.openembedded.org/wiki/Patchwork#Multiple_layers_sharing_the_same_oe_project_on_patchwork
>
> I'm writing this, because currently many changes are missing on patchwork,
> because of some unknown issue with it, see:http://lists.openembedded.org/pipermail/openembedded-devel/2017-February/111467.html
> once this issue is resolved, please re-send missing changes.
>
> Regards,
>
>
>
>
> --
> Michael Halstead
> Linux Foundation / SysAdmin
>
>

