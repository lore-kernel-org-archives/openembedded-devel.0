Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id CB336607A5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 12:58:30 +0000 (UTC)
Received: by iofz202 with SMTP id z202so78459669iof.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 05:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems_com_br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:content-type; bh=XlHTm0tTM8JIo17GHLmaN5xI4ozY8ROup29b9pjjTzM=;
	b=l9Qw/Adl3R1eUCoTggltDD/+xsXHD8NLKyPT9eUm+WoiJRmoyvFXi3HvHk/fF25QVf
	zTfNtwUFkhp1uHhlHG33WPV1KSEIE+rN2rXYjoCvDf13AJv8ZY+1+/siuSkipcd/tF2H
	xs0lLOxxq8fIJKzntiaft/5xt52ykSQJO5mkl2NySrNKlXskPa5Y3pCMsLx3QdaWO6k+
	YRgRI4U3hx0FBUB1q7+MjjcyZnZOUgdIbEtu8+3bhTE9IW7bWSqr/nmuak0kVStRTKTB
	10j4QW4n6F99Jlg1NYFflAQhuPVLF3yf11dXAYD6QF6Qa51nkdsM4XSS9cxU0vHmdNJi
	UIQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:content-type;
	bh=XlHTm0tTM8JIo17GHLmaN5xI4ozY8ROup29b9pjjTzM=;
	b=AVd/paruwaOdfY180raFGEin/oooFpPd8myWakgKKL80qm4EkPvUOSsUigdmk3icO1
	jXnqKqbPqsXJJCXQIlUZfoqWvtH1iOkqfIoJNnIWcAR2MxvouZNu/su5n39i84E/vUdc
	ZW8epWVk3fkbAVGe7d4FR62+tJMhWGYhDfT3wq66BrhL4BFnC5svw236/xN6KZad55cU
	xIlz5OVFGEdJqazH/H7oKbxzku38nMQhl/LkiT2yZGEYyRyvRrKEDrcWhHrq0oUtRC6s
	u7nWyepmlRTjUj7+XaBKZ5cJZwEsXXZEu10JoL5Hzu/fTHPJ/y5ZR1ogc9NM/jckDTHl
	8C0g==
X-Gm-Message-State: ALoCoQnRKPvz8FalMQ2Bv+adM2hydXuJNYI4vfDh8rYsdhBgRNqLI9LZuewAwIcpQWZEtqtLKDfN
X-Received: by 10.107.33.211 with SMTP id h202mr8887499ioh.108.1446209910491; 
	Fri, 30 Oct 2015 05:58:30 -0700 (PDT)
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com.
	[209.85.223.175])
	by smtp.gmail.com with ESMTPSA id j10sm892969igx.13.2015.10.30.05.58.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Oct 2015 05:58:29 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by ioll68 with SMTP id l68so79174567iol.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 05:58:28 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.17.88 with SMTP id z85mr10840087ioi.97.1446209908758;
	Fri, 30 Oct 2015 05:58:28 -0700 (PDT)
Received: by 10.36.24.4 with HTTP; Fri, 30 Oct 2015 05:58:28 -0700 (PDT)
In-Reply-To: <CAAzKXnjT0WeXKUsi2Lac-YDGxvZ5o5mV3oEE9cuFhJbSfi8LWQ@mail.gmail.com>
References: <CAAzKXnjdUYmLrXX4bCT9wmcH9nc3c1OL7eRsdTXXD-T70RDZmA@mail.gmail.com>
	<2f4be637747c4a7eb3f2d5dd7a0b8465@XCH-ALN-008.cisco.com>
	<CAJ86T=VWjYJLyF9dD6LhGFb1cVyuzxT4gSqcgGLfRsTfT6UCHQ@mail.gmail.com>
	<CAAzKXnjT0WeXKUsi2Lac-YDGxvZ5o5mV3oEE9cuFhJbSfi8LWQ@mail.gmail.com>
Date: Fri, 30 Oct 2015 10:58:28 -0200
Message-ID: <CAP9ODKqOMdOJwtypY21_xsE6T-rctOJ5dr4tDjJqf_pGVSUTHg@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser] Recipes draft for Chromium V45 and V47
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
X-List-Received-Date: Fri, 30 Oct 2015 12:58:31 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 30, 2015 at 10:28 AM, Zoltan Kuscsik
<zoltan.kuscsik@linaro.org> wrote:
> Thanks for the comments. I'm going to clean up the recipes and I'm trying
> to upstream some of the
> patches to chromium to reduce the maintenance on meta-browser.

Awesome :-) I look forward to see those patches ... :-)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

