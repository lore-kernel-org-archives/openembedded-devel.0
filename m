Return-Path: <max.oss.09@gmail.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id D805D6AC1E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Apr 2015 10:56:19 +0000 (UTC)
Received: by qgeb100 with SMTP id b100so32845803qge.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Apr 2015 03:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=GkeV2nCnaU/euNNuDjbjXzjX/XPcTA85JeD8+KguDLY=;
	b=oL/FFglgEo5+xHfVebEGE0mv61MeiOzrpAiIKHXokF+fCCuncNESyTNiYvcXh5pjTz
	ZgNNb3tZbFOS3Nswa59xZyuZUfVLyNqbGMW/8XfupWwPU3r0t69N6zjOj1AKdkja6drz
	IBnTKXsiBA8mZlA2w1n+hDUZkOk5JQ2iz0qs5T4q4Rp3E041MAIYvCxYxrqz8atd3Ohc
	1AXygyazBkY2L9h5YfTWjpVVS5KqQ0sdTlUS2yKGQTUyv42ZZDg11zMZFWTm/BrTNj/8
	HVbbohJ1GkQPeM2qUCr8hkDAPQKfKownSrCXTGL1Af9diu9XgN+vtCeY2r1VWb6SMCsx
	sFDA==
MIME-Version: 1.0
X-Received: by 10.55.43.83 with SMTP id r80mr13717365qkh.80.1429354580191;
	Sat, 18 Apr 2015 03:56:20 -0700 (PDT)
Received: by 10.140.22.213 with HTTP; Sat, 18 Apr 2015 03:56:20 -0700 (PDT)
In-Reply-To: <4F9216F96E5DF9428610502835A9F49058189466@DLEE11.ent.ti.com>
References: <4F9216F96E5DF9428610502835A9F49058189466@DLEE11.ent.ti.com>
Date: Sat, 18 Apr 2015 12:56:20 +0200
Message-ID: <CAEHkU3VrhMvNngrOK=9dxycuV3XkgRFrLwqKfaoAg2Bnv1ZYpg@mail.gmail.com>
From: Max Krummenacher <max.oss.09@gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	sam.nelson@ti.com
Subject: Re: [meta-java] Query on fetch issue with rhino_1.7r4.bb
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
X-List-Received-Date: Sat, 18 Apr 2015 10:56:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Sam

I can correctly download rhino.
Both with the browser and with the bitbake fetcher.
bitbake -c cleanall rhino; bitbake -c fetch rhino

Maybe a temporary connection problem or some firewall issue with https
on your installation?

Regards
Max

2015-04-18 5:48 GMT+02:00 Nelson, Sam <sam.nelson@ti.com>:
> I am seeing following fetch error when trying to build  rhino_1.7r4.bb.
> Anybody else seeing this?  Appreciate any help on this.
>
> WARNING: Failed to fetch URL https://github.com/downloads/mozilla/rhino/rhino1_7R4.zip, attempting MIRRORS if available
> ERROR: Fetcher failure: Fetch command failed with exit code 4, output:
> OpenSSL: error:14077410:SSL routines:SSL23_GET_SERVER_HELLO:sslv3 alert handshake failure
> Unable to establish SSL connection.
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

