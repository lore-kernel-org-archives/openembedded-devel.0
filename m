Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OgT3l-0000wd-79
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 03:46:22 +0200
Received: by wyb38 with SMTP id 38so5235523wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Aug 2010 18:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=k9TcHvDVug/Qiw2EXpjyMSLJNRmBzxDmykJpNvzOaf4=;
	b=kcJVurJUlWbalhPx4QYNFpsdW0lPxE3CfzlWrJqLADkEYCJs+SQ7jOtaHdgO8Mottn
	JA+CyBOoV8WMWofWfqhJbcocbzIC7r5qeBHsxcWqVo1JjH5lsb6JbulMBCemuqFIlh0Q
	WObEUB+abnWaw8q5daZ5mvGqPOdY/+6YvEx/s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=tj66kyrjNJcObPkvPkYjHnk051p9cUDjJvIWS9F1z4ZmtcWB4sdsVzFrtfpay9FwYh
	k/VjBH+dsWF5YHWqDSjTN4+uMmSeb0V7X2f6bQQPMYeACXubgr3R9NgQpiAC49gu8NO2
	NvhTpdFikmQMKgjuf4wyrvsThffh+BGiWJhXA=
Received: by 10.216.164.9 with SMTP id b9mr1432218wel.35.1280886377523; Tue, 
	03 Aug 2010 18:46:17 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.16.204 with HTTP; Tue, 3 Aug 2010 18:45:57 -0700 (PDT)
In-Reply-To: <1280886048-6272-1-git-send-email-clarson@kergoth.com>
References: <1280886048-6272-1-git-send-email-clarson@kergoth.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 3 Aug 2010 18:45:57 -0700
X-Google-Sender-Auth: nbcAdAEVzjQ9rz6xqTOAIfQqKJA
Message-ID: <AANLkTinsG=odoSS3mTj-_cH9zvbb+JZdVOQyJvJ4M05z@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH (resend)] image.bbclass: implement IMAGE_FEATURES
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Aug 2010 01:46:22 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 3, 2010 at 6:40 PM, Chris Larson <clarson@kergoth.com> wrote:

> From: Christopher Larson <clarson@mvista.com>
>
> This adds the ability to include groups of packages in an image.  It is
> similar in concept to the IMAGE_FEATURES used in Poky, but here we use
> IMAGE_FEATURE_<feature> and IMAGE_FEATURE_<feature>_OPTIONAL, rather than
> base_contains calls.
>
> Initially defined groups:
> base - the packages requested via IMAGE_INSTALL & IMAGE_BOOT
> dbg - debug packages
> dev - development packages
> doc - documentation packages (of limited use at the moment due to
> task.bbclass)
> vmlinux - kernel debugging packages (just kernel-vmlinux at the moment)
>
> To add groups to your images:
> IMAGE_FEATURES += "dbg dev"
>
> To add a new package group:
> IMAGE_FEATURE_myfeature = "gstreamer python pulseaudio"
>

Note that using package_dbg.bbclass can be useful when using the "dbg"
group/feature, as it switches to using one -dbg package per binary package,
rather than per recipe.  INHERIT += "package_dbg".
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

