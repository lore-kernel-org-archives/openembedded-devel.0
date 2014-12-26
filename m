Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f50.google.com (mail-yh0-f50.google.com
	[209.85.213.50])
	by mail.openembedded.org (Postfix) with ESMTP id D4695727EC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Dec 2014 19:33:47 +0000 (UTC)
Received: by mail-yh0-f50.google.com with SMTP id 29so5746917yhl.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Dec 2014 11:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=S7wJVPM5Me5DIuCQ+MBENhtfKmLDPdqNBgOxPSRECiY=;
	b=zzpxJq/NPswc9sa0qOnhSmWoKujsxOVhozoNOrDNGXnbjedCOHvc4i+49uyqk0iXhl
	Y8+bROy6mjS/Qo+0nhVO56GbzFKzCO0qPBjiftQO12DcIZeV/D/5KLr5Ch4Ove22bzxE
	2xyF4eJNv2EAQ2pVPouRFdrx1enHG8oX9KZSPBlenXabjSrJDnUBNLfbDQuJnwuWAaFy
	e3zjF+2zD2hIRNRWbQ1dLcNZZG/VrT/18N4fXKBSeeRydwA4v1kWHC9uaxDnkQek2i44
	vWY+jVzU+cZ9DqSOxMhK5avPxdS0A7nZXVkzK8rR/+aHaMl0E/EAisVOXACE6p1/z4Uc
	Re+w==
MIME-Version: 1.0
X-Received: by 10.170.211.67 with SMTP id c64mr37036907ykf.110.1419622428191; 
	Fri, 26 Dec 2014 11:33:48 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.171.132 with HTTP; Fri, 26 Dec 2014 11:33:48 -0800 (PST)
In-Reply-To: <1419615386-27100-2-git-send-email-alex.gonzalez@digi.com>
References: <1419615386-27100-1-git-send-email-alex.gonzalez@digi.com>
	<1419615386-27100-2-git-send-email-alex.gonzalez@digi.com>
Date: Fri, 26 Dec 2014 17:33:48 -0200
X-Google-Sender-Auth: hEU-Y9P56ByZkvRmCdfQnVSLOMI
Message-ID: <CAP9ODKpGkMw4oQgt3ur=qsNFWRwSLrGHo6BLTZqmS3rNwN=HGQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [openembedded-devel][meta-java][PATCH] openjdk: fix do_install for out of source builds
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
X-List-Received-Date: Fri, 26 Dec 2014 19:33:56 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Dec 26, 2014 at 3:36 PM, Alex Gonzalez <alex.gonzalez@digi.com> wrote:
> From: Max Krummenacher <max.oss.09@gmail.com>
>
> use ${B} to specify the build directory, thus keep working for
> daisy and older versions as well as for dizzy and newer.

Applied.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

