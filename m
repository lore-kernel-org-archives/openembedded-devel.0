Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1TAxEu-0001yG-Cr
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Sep 2012 08:12:56 +0200
Received: by eekb57 with SMTP id b57so724753eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Sep 2012 23:00:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=OZ8eiOrzzyPiCex5LM43JVd9eC3cPE1uPwryfMS+3xA=;
	b=EJn+OHLcpuHZVOaZIiIQSgzHRjLeOPt1iPyKtgXrNfql9KNdFF6XmGeq46H6ZaNYLB
	GqvrsttmmZ0CuCrU/U3D+LX+ERswXsuvki+hVaj17qlGASyfynowVa5oyIZtT12vhPMu
	dNtmklBV4u+vHl0WFJ35WTssnqkth9mpp4PGJZ10WyIHQjjD6fTU+oYSJZFxnozY2Br7
	eNg7i78g+SaIeK3I2heDF1unMp7h2quJtI/UVw1QqVhyvb8ZJy/8V+9KOEgcOt58OKg2
	yXXVme+YNHtyb5nTSBrJxRPVGTo/h5W/YsKTu7+cgdI7C1f5eq/p6PGi9sGQY9Gblr+0
	EGBQ==
Received: by 10.204.154.73 with SMTP id n9mr3400896bkw.113.1347256826887;
	Sun, 09 Sep 2012 23:00:26 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de (zk223.dresearch-fe.de.
	[217.92.177.116])
	by mx.google.com with ESMTPS id 14sm5909111bkq.12.2012.09.09.23.00.25
	(version=SSLv3 cipher=OTHER); Sun, 09 Sep 2012 23:00:26 -0700 (PDT)
Message-ID: <504D81F8.9020702@dresearch-fe.de>
Date: Mon, 10 Sep 2012 08:00:24 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120825 Thunderbird/15.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1346107854-28927-1-git-send-email-raj.khem@gmail.com>
	<50489445.3020100@dresearch-fe.de>
In-Reply-To: <50489445.3020100@dresearch-fe.de>
X-Enigmail-Version: 1.4.4
X-Gm-Message-State: ALoCoQnZ8uCBkakYDPLFC1TFmk9m2Q4rqM6A/52AE6vynYmwjNAFEUf0eK1nTrY9u6tpLgVnbadR
Subject: Re: [2011.03-maintenance][PATCH] gtk+_2.20.1: Depend on gdk-pixbuf-native
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
X-List-Received-Date: Mon, 10 Sep 2012 06:12:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

On 06.09.2012 14:17, Steffen Sledz wrote:
> On 28.08.2012 00:50, Khem Raj wrote:
>> also BBCLASSEXTEND gdk-pixbuf recipes to provide
>> native version
>>
>> Newer distros which ship glib-2.0 version 2.32+
>> there are some missing symbols that gtk+ 2.20
>> will complain about. So we create own gdk-pixbuf
>> so it does not link to library from host system
> 
> It seems that the dependencies are incomplete.
> 
> -----------> snip <-----------
> ...
> | checking for BASE_DEPENDENCIES... configure: error: Package requirements (glib-2.0 >= 2.12.0    atk >= 1.9.0    pango >= 1.12.0    cairo >= 1.2.0) were not met:
> |
> | No package 'atk' found
> | No package 'pango' found
> | No package 'cairo' found
> |
> | Consider adjusting the PKG_CONFIG_PATH environment variable if you
> | installed software in a non-standard prefix.
> |
> | Alternatively, you may set the environment variables BASE_DEPENDENCIES_CFLAGS
> | and BASE_DEPENDENCIES_LIBS to avoid the need to call pkg-config.
> | See the pkg-config man page for more details.
> |
> NOTE: package gdk-pixbuf-native-2.10.14-r2: task do_configure: Failed
> -----------> snip <-----------

Ping!

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


