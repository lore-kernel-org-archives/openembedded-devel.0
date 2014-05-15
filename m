Return-Path: <nicolas.dechesne@linaro.org>
X-Greylist: delayed 483 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 15 May 2014 20:41:55 UTC
Received: from mail-oa0-f45.google.com (unknown [209.85.219.45])
	by mail.openembedded.org (Postfix) with ESMTP id E28836609B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 May 2014 20:41:55 +0000 (UTC)
Received: by mail-oa0-f45.google.com with SMTP id l6so1952260oag.18
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 May 2014 13:41:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=26wvZ+0gEXd62Yb/Dl/KEkxQYbuFRokirra4s+6il6k=;
	b=J8/bPtUyHI6CTRwB3Ctn1Cu5ElFDq8h+/Y2WbLuUZyN2QCywHJuSYm9uKALf7are1e
	MBtrpuV+4/RZCE7JOXysInGU2zrz+Cz05FMqghvQZfeRdLMtDWWcmgPPu8tXbY5t9p0O
	3LA5hqaHvdpJZpMfyxj+08OuhlZq1URdg5Xuv+0mT/vrjRV4H/W35cHz3bl4RHy/sKOS
	IIru+JFVcWVxGg+MEZWgBt6sR3eibc7MQNAkT4E+jVKttXPumDzIRdOm5wWvCV8HpEQX
	B6V7yw6nSAKYlRvVITrLEdhYeA44ROitxwgFmPxjemim/ZeaulAHCk0snJotP3ouv0Nb
	1leg==
X-Gm-Message-State: ALoCoQk79Jko03ad0Q93DEm6fDdOgSvqhtbBUvAQRqZ2EqTihqD+jyga+BdCGoBzblgk+a4fkgSg
X-Received: by 10.60.130.195 with SMTP id og3mr12557500oeb.36.1400186033522;
	Thu, 15 May 2014 13:33:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.115.164 with HTTP; Thu, 15 May 2014 13:33:33 -0700 (PDT)
In-Reply-To: <CAFeBWL4O6Uv6d+KoKQcHdzKZpog0OYnNA794jYRcJEovw88X9g@mail.gmail.com>
References: <CAFeBWL4O6Uv6d+KoKQcHdzKZpog0OYnNA794jYRcJEovw88X9g@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 15 May 2014 22:33:33 +0200
Message-ID: <CAP71Wjz70nHPpYu-kYF_rHAardHZr-bVj+La3fJaH9R9Tf9pDA@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: initramfs only supported in x86?
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
X-List-Received-Date: Thu, 15 May 2014 20:41:58 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 15, 2014 at 7:13 PM, Adam Lee <adam.yh.lee@gmail.com> wrote:
> Hello everyone, I thought I'd compare the performance of booting
> rootfs from MMC vs ramdisk (the way Android is doing it). Some says it
> may possibly take longer in ramdisk because the rootfs has to be first
> loaded into memory. I'd like to test it out myself.
>
> So I discovered core-image-minimal-initramfs, and thought it was
> exactly what I needed. However the build doesn't go far, because its
> dependency initramfs-live-install [1] only seems to support x86:
>
> COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
>
> Is this the limitation of current OE? or am I just looking at the wrong corner?

i recently had to build an initrd too, and notice that as well... so i
am not sure exactly what that means. I am glad you asked... however if
you want to test an initrd, you can simply build *any* image and make
sure to build the 'cpio' from IMAGE_FSTYPES. you can then use the
generated cpio archive as an initrd.

