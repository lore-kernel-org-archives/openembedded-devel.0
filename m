Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1T9bDF-0004XW-0u
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 14:29:37 +0200
Received: by bkcik5 with SMTP id ik5so906781bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Sep 2012 05:17:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=9+OoBd+nEsGC6B3+U6ygckMnIgMPNwnHMcFBa7bVI24=;
	b=n6xhBf2C1Al72d+RvX7a3aWL42hLVe+bISqGSZRZkv1S6UWlBcurwqK4n+cOYBNAUW
	bDcdYnC+SsrDAXPGtwi44gt/dHP9PlSPqBtj/HeBtnBuhBBcE/IUmbT2Up+hv7bBY/R2
	V4xOzYheFpvp5R81RvD0JohQosaCo45bSLXUCq5RiwBEFOil+8SIIS4Tnl2cEm4U9aqC
	f3FNtWpCLavX+X8gSkdi3KGDhSrSbl6upgPw+SkvUIBU+KOE5xeXryZjfU0RbpuIWpm9
	6Vm2nDvs4rFlXh+0AgRWan+YLV32/ODzQUtbYNCMelVwSk5frTBNZm/YEbhkt+fZIp6N
	23fA==
Received: by 10.205.127.77 with SMTP id gz13mr805136bkc.17.1346933832447;
	Thu, 06 Sep 2012 05:17:12 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de (zk223.dresearch-fe.de.
	[217.92.177.116])
	by mx.google.com with ESMTPS id hg13sm1107393bkc.7.2012.09.06.05.17.10
	(version=SSLv3 cipher=OTHER); Thu, 06 Sep 2012 05:17:11 -0700 (PDT)
Message-ID: <50489445.3020100@dresearch-fe.de>
Date: Thu, 06 Sep 2012 14:17:09 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120825 Thunderbird/15.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1346107854-28927-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1346107854-28927-1-git-send-email-raj.khem@gmail.com>
X-Enigmail-Version: 1.4.4
X-Gm-Message-State: ALoCoQmBiNpYiH+hcHDyoN/RZBv8AOgzuY0kAj5VziYy7sJEoU6Ppx5ymWHJhH+NuD213c2z7zB9
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
X-List-Received-Date: Thu, 06 Sep 2012 12:29:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

On 28.08.2012 00:50, Khem Raj wrote:
> also BBCLASSEXTEND gdk-pixbuf recipes to provide
> native version
> 
> Newer distros which ship glib-2.0 version 2.32+
> there are some missing symbols that gtk+ 2.20
> will complain about. So we create own gdk-pixbuf
> so it does not link to library from host system

It seems that the dependencies are incomplete.

-----------> snip <-----------
...
| checking for BASE_DEPENDENCIES... configure: error: Package requirements (glib-2.0 >= 2.12.0    atk >= 1.9.0    pango >= 1.12.0    cairo >= 1.2.0) were not met:
|
| No package 'atk' found
| No package 'pango' found
| No package 'cairo' found
|
| Consider adjusting the PKG_CONFIG_PATH environment variable if you
| installed software in a non-standard prefix.
|
| Alternatively, you may set the environment variables BASE_DEPENDENCIES_CFLAGS
| and BASE_DEPENDENCIES_LIBS to avoid the need to call pkg-config.
| See the pkg-config man page for more details.
|
NOTE: package gdk-pixbuf-native-2.10.14-r2: task do_configure: Failed
-----------> snip <-----------

Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


