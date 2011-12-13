Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1RaNZs-0007LJ-Mk
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Dec 2011 09:19:08 +0100
Received: by wgbds11 with SMTP id ds11so11288555wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2011 00:12:13 -0800 (PST)
Received: by 10.216.139.79 with SMTP id b57mr3033061wej.111.1323763933410;
	Tue, 13 Dec 2011 00:12:13 -0800 (PST)
Received: from fensuse.internal.dresearch-fe.de
	(pd95cb174.dip0.t-ipconnect.de. [217.92.177.116])
	by mx.google.com with ESMTPS id m13sm26013095wbh.0.2011.12.13.00.12.12
	(version=SSLv3 cipher=OTHER); Tue, 13 Dec 2011 00:12:12 -0800 (PST)
Message-ID: <4EE708DC.8000901@dresearch-fe.de>
Date: Tue, 13 Dec 2011 09:12:12 +0100
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1323450027-31964-1-git-send-email-sledz@dresearch-fe.de>
	<CAMKF1sqkmOx6wPHA9vZNPp_XMhZN+s8fLy74wDcCLt4OvUVGtQ@mail.gmail.com>
	<4EE3346C.1040703@dresearch-fe.de>
In-Reply-To: <4EE3346C.1040703@dresearch-fe.de>
X-Enigmail-Version: 1.3.4
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
X-List-Received-Date: Tue, 13 Dec 2011 08:19:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.12.2011 11:29, Steffen Sledz wrote:
> Am 09.12.2011 20:59, schrieb Khem Raj:
>> On Fri, Dec 9, 2011 at 9:00 AM, Steffen Sledz <sledz@dresearch-fe.de> wrote:
>>>        done
>>> +
>>> +       for F in openjdk/hotspot/make/linux/Makefile openjdk-ecj/hotspot/make/linux/Makefile ;
>>> +       do
>>> +               sed -i \
>>> +                       -e"s|SUPPORTED_OS_VERSION = 2.4% 2.5% 2.6% 2.7%|SUPPORTED_OS_VERSION = 2.4% 2.5% 2.6% 3%|" \
>>> +                       $F
>>> +       done
>>>  }
>>
>> why drop the 'dot' may be using 3. is better ?
> 
> Just following the scheme, e.g. 2.6% is without a dot too.

Ping!

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


