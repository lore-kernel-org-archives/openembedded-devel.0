Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mr.dash.four@googlemail.com>) id 1RZRn1-0005e3-CB
	for openembedded-devel@lists.openembedded.org;
	Sat, 10 Dec 2011 19:36:51 +0100
Received: by wgbds11 with SMTP id ds11so6914755wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Dec 2011 10:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=message-id:disposition-notification-to:date:from:user-agent
	:mime-version:to:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=cH4l+Pm6p2JgTDhdFdH7N8ovI6oLGFMM50ZE1vkVu6g=;
	b=h3HmXK7NvWQ1xO/38khUGe3DV9a2Vz2lGAafZWyYaUb/WEAzR+XLviKWOeRGKhoUwb
	fTwiJwFcuhDjKFj0tibGh4Hy/TkaKvL0yvaQR88XSvyp068tOjTDJw8HhFm4gTjRvWZw
	rHZYtu3nTygD5Eb8b2CghbWt3l/f7NAVT3wWs=
Received: by 10.180.88.66 with SMTP id be2mr15285520wib.54.1323541799064;
	Sat, 10 Dec 2011 10:29:59 -0800 (PST)
Received: from [10.68.68.173]
	(cpc2-gill1-0-0-cust1894.basl.cable.virginmedia.com. [82.34.63.103])
	by mx.google.com with ESMTPS id fi11sm16964651wbb.9.2011.12.10.10.29.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 10 Dec 2011 10:29:57 -0800 (PST)
Message-ID: <4EE3A51E.2000409@googlemail.com>
Date: Sat, 10 Dec 2011 18:29:50 +0000
From: Mr Dash Four <mr.dash.four@googlemail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB;
	rv:1.8.1.23) Gecko/20090812 Thunderbird/2.0.0.23
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4EE17931.7000609@googlemail.com>
	<CABcZANn76DwH5QPkZw_zPVBHxS0F3a-7YgKebU3Hd=+CtZd+eQ@mail.gmail.com>
In-Reply-To: <CABcZANn76DwH5QPkZw_zPVBHxS0F3a-7YgKebU3Hd=+CtZd+eQ@mail.gmail.com>
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
X-List-Received-Date: Sat, 10 Dec 2011 18:36:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


> PREFERRED_VERSION_udev = "165"
>   
OK, hit a bit of a snag:

PREFERRED_VERSION_wpa-supplicant = "0.7.3"

but this still produces wpa-supplicant_0.6.9-r6.1.6_armv6-novfp.ipk and 
wpa-supplicant-passphrase_0.6.9-r6.1.6_armv6-novfp.ipk. The recipe for 
wpa-supplicant_0.7.3 is there, don't know why isn't used/included. Any 
ideas on what I am doing wrong?

I also found two more errors when trying to include/compile 
xtables-addons - there are two versions available in oe - 1.26 & 1.28. I 
was planning to adapt the newest one (1.28) to compile the latest 
xtables-addons, as well as be able to customise the various modules 
which are included by "default" in this recipe, though I get the 
following errors which prevent building this package and including it 
into the image:

v1.28:
~~~~
ERROR: Task do_unpack in 
/home/mr-4/oe/openembedded/recipes/xtables-addons/xtables-addons_1.28.bb 
depends upon nonexistant task do_populate_staging in 
virtual:native:/home/mr-4/oe/openembedded/recipes/xz/xz_5.0.0.bb

I first thought that there is a dependency missed for including "xz", 
but even if I include this in my local.conf I still get the above error. 
Any idea what is causing this?

v1.26:
~~~~~
arm-oe-linux-gnueabi-ld: unrecognized option '-Wl,-O1'
arm-oe-linux-gnueabi-ld: use the --help option for usage information

That, I suppose, comes from the make linker flags. I am not sure this 
should be included there (shoudn't that be just "-O1"?).


