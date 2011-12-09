Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RYr4r-0005ov-7g
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Dec 2011 04:24:49 +0100
Received: by qadb17 with SMTP id b17so1289804qad.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Dec 2011 19:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=Mkhibdm1ssfiH8KckUcv0qXq9F+waXXwLCMoyMlfHXw=;
	b=LA49f4Hnm5/Zcx/31qgebjQKPfX8vHPF9Q+nFHlEDtqjklaujKHqghhx7Rf29zTies
	YgLZR1mZLaaMyPdOtBHunJJFtQ/1u0DTqNZuKqtRrs9ntc7bmvn41UItkjX2aFvCi+Dl
	rY0domSvO+YB2+RzjQA7ep0P/5ec5plccp+/U=
Received: by 10.224.203.202 with SMTP id fj10mr5412274qab.66.1323400677432;
	Thu, 08 Dec 2011 19:17:57 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.73.200 with HTTP; Thu, 8 Dec 2011 19:17:36 -0800 (PST)
In-Reply-To: <4EE17931.7000609@googlemail.com>
References: <4EE17931.7000609@googlemail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 8 Dec 2011 20:17:36 -0700
X-Google-Sender-Auth: G8pNY4fHMBvpEx3Ykf_LEcmudSM
Message-ID: <CABcZANn76DwH5QPkZw_zPVBHxS0F3a-7YgKebU3Hd=+CtZd+eQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: packages versioning
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
X-List-Received-Date: Fri, 09 Dec 2011 03:24:49 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Dec 8, 2011 at 7:57 PM, Mr Dash Four
<mr.dash.four@googlemail.com> wrote:
> Is there a way I could force/select a particular version of a specific
> package in a given target?
>
> I am building my fso-console-image and I would like it to use udev-165
> instead of udev-162, but I can't find a way to alter this. I could build
> udev-165 separately - no problem, but don't know how to integrate this into
> the main task of building the image itself.

PREFERRED_VERSION_udev = "165"

> Also, is there a way I can include additional packages as part of that
> fso-console-image build? I'd like to have openvpn, a different version of
> wpa_supplicant, openssl etc.

IMAGE_INSTALL_append = " openvpn"

-- Christopher Larson


