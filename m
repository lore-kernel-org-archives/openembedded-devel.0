Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1RZKHd-00034u-7D
	for openembedded-devel@lists.openembedded.org;
	Sat, 10 Dec 2011 11:35:58 +0100
Received: by bkbzt4 with SMTP id zt4so3814239bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Dec 2011 02:29:04 -0800 (PST)
Received: by 10.205.139.76 with SMTP id iv12mr5938586bkc.100.1323512944566;
	Sat, 10 Dec 2011 02:29:04 -0800 (PST)
Received: from [217.197.84.226] (recycler.in-berlin.de. [217.197.84.226])
	by mx.google.com with ESMTPS id j9sm16152685bkd.2.2011.12.10.02.29.02
	(version=SSLv3 cipher=OTHER); Sat, 10 Dec 2011 02:29:03 -0800 (PST)
Message-ID: <4EE3346C.1040703@dresearch-fe.de>
Date: Sat, 10 Dec 2011 11:29:00 +0100
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1323450027-31964-1-git-send-email-sledz@dresearch-fe.de>
	<CAMKF1sqkmOx6wPHA9vZNPp_XMhZN+s8fLy74wDcCLt4OvUVGtQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqkmOx6wPHA9vZNPp_XMhZN+s8fLy74wDcCLt4OvUVGtQ@mail.gmail.com>
Cc: Steffen Sledz <sledz@dresearch.de>
Subject: Re: [PATCH] icedtea6-native: fix problem on build hosts with linux kernel 3.x
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
X-List-Received-Date: Sat, 10 Dec 2011 10:35:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Am 09.12.2011 20:59, schrieb Khem Raj:
> On Fri, Dec 9, 2011 at 9:00 AM, Steffen Sledz <sledz@dresearch-fe.de> wrote:
>>        done
>> +
>> +       for F in openjdk/hotspot/make/linux/Makefile openjdk-ecj/hotspot/make/linux/Makefile ;
>> +       do
>> +               sed -i \
>> +                       -e"s|SUPPORTED_OS_VERSION = 2.4% 2.5% 2.6% 2.7%|SUPPORTED_OS_VERSION = 2.4% 2.5% 2.6% 3%|" \
>> +                       $F
>> +       done
>>  }
> 
> why drop the 'dot' may be using 3. is better ?

Just following the scheme, e.g. 2.6% is without a dot too.

Steffen




