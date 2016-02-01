Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 41FC5771D3
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Feb 2016 21:22:29 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id 9so93943257iom.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Feb 2016 13:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=RhfPNLj2C3pJGk4oiWItnvPS2u6kH0uO0hrwvtv4nMY=;
	b=Zr8cYJg4jnLb8tLs8ApGe5PWd6O89C7gkvnxCYhMtMvDP0U3NqTieMtm1+qzvw3+0z
	kQ7roO1XifR4GAFA8QvfCcLePCsRKoN3xrqI6W/M+R60UmepZFA7hFpLDhZa3ucgKnRo
	+NUUD9hp4fgopoGb+kSQZRrfSWOD6ZVyO12T0RbXyfRK6IRiQshenztkQQ1C6OJ/y5Pc
	5YCiZzGNhtbJ2dzER+YQ82U1S2IAzgTu1jTmj3+iBDN3Nh17alqLKszN+I38tylEHJvM
	NziVDKZdLzMAc606pateAFlXImOH8vPl5lM/ae65/w0OQIm76yi+U2206VBvsFUsM8Zu
	Ho2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=RhfPNLj2C3pJGk4oiWItnvPS2u6kH0uO0hrwvtv4nMY=;
	b=JAUpFlDfaVCtxyPK3CQPwQxXRuV2aicdezIfZqunLs1mOO33eY/KxRV/cXRTmg8hlr
	2rMy0eh49UFiUqIf5UeDIA7RZxZ7cittVMGZi0YsMO6x8qJNMquQPgpL+qV8zhJrT6Iu
	VV8o/L4FV2wk4v57dDuGq1gzQHNV0Y1GeNyIxtKSQ0eshgnrnS0aHVXyF/T92YVK8j5P
	d4D5W/czqoj4xeYTQQwebrn24VPjV75gyRPlkglgp2aNXgxfZYsgBtwK7sZp8CNxipyJ
	jmLAxRmv/5o6Qdh3GeFz+0ciYRly2xj4G2gM0JXJdfBvLzJu7nqiy3NifPiHhIQ9CQ9E
	s/5w==
X-Gm-Message-State: AG10YOQEWet7I086u6rw3XRako6QnzIU7zXM94RsxTUD/JnaB8nFbvNZB4biYRpnEtCia/zJBomjboSfyxZyDy9K
X-Received: by 10.107.10.157 with SMTP id 29mr11131736iok.133.1454361750491;
	Mon, 01 Feb 2016 13:22:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 1 Feb 2016 13:22:11 -0800 (PST)
In-Reply-To: <CAJ86T=XrU3Rz0OMk7EukArS07PBCifE89U2vhmqKcBDAytZ3xQ@mail.gmail.com>
References: <20160201143944.GA2639@jama>
	<CAJ86T=XrU3Rz0OMk7EukArS07PBCifE89U2vhmqKcBDAytZ3xQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 1 Feb 2016 21:22:11 +0000
Message-ID: <CAJTo0LYG2=+s=+a4ptGFcM4d-XuS5pRCkHLodGK-CY23CbROfw@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2016-01-30
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
X-List-Received-Date: Mon, 01 Feb 2016 21:22:32 -0000
Content-Type: text/plain; charset=UTF-8

On 1 February 2016 at 20:47, Andre McCurdy <armccurdy@gmail.com> wrote:

> There seems to be something odd going on with these file-rdeps warning
> messages. e.g.
>
>   chkconfig-1.3.58: /usr/sbin/ntsysv_chkconfig contained in package
> chkconfig ...
>
> Should be:
>
>   chkconfig-1.3.58: /usr/sbin/ntsysv contained in package chkconfig ...
>

Yes, insane.bbclass needs to sanitise the string for display.  If the
filename contains an underscore you get that appearing as @underscore@ too!
:)

(patches welcome)

Ross

