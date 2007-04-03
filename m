Received: from [212.227.126.177] (helo=moutng.kundenserver.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <fischer@4g-systems.com>) id 1HYfHB-0001tX-GE
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Apr 2007 11:26:05 +0200
Received: from [213.238.49.68] (helo=dehamox1a.intra.4g-systems.com)
	by mrelayeu.kundenserver.de (node=mrelayeu0) with ESMTP (Nemesis),
	id 0MKwh2-1HYfH93SHA-00042q; Tue, 03 Apr 2007 11:26:04 +0200
Received: from [172.31.20.70] (deham-pc1070.intra.4g-systems.com
	[172.31.20.70])
	by dehamox1a.intra.4g-systems.com (Postfix) with ESMTP id 6AEE06128D6
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Apr 2007 11:26:03 +0200 (CEST)
Message-ID: <46121DAB.5050309@4g-systems.com>
Date: Tue, 03 Apr 2007 11:26:03 +0200
From: Patrick Fischer <fischer@4g-systems.com>
User-Agent: Icedove 1.5.0.9 (X11/20061220)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <46121476.1030609@4g-systems.com>
	<461216D1.1010705@dominion.kabel.utwente.nl>
In-Reply-To: <461216D1.1010705@dominion.kabel.utwente.nl>
X-Provags-ID: V01U2FsdGVkX1/0U4pHgWBxvm9P4Jz/mbwjpk/THkVHc7j2/7r
	XpgiTr0Nw2sYHSXdaGIWs+omXySCp98aHSqQAoF6IxCKkWOZhK
	20WxvBpAB4bGAxWjJa8LA==
Subject: Re: DosFStools mirror missing
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Apr 2007 09:26:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> Patrick Fischer schreef:
>   
>> Andre Renaud wrote:
>>     
>>> The mirror for DosFSTools,
>>> ftp://ftp.uni-erlangen.de/pub/Linux/LOCAL/dosfstools/dosfstools-${PV}.src.tar.gz
>>>
>>>
>>> appears to be down at the moment. Using the Debian mirror however works
>>> fine. Attached is an alternative bitbake package which uses the debian
>>> mirror system to do the download, which should be much more robust.
>>>       
> INHERIT += "angstrom-mirrors" will give you access to
> http://www.angstrom-distribution.org/unstable/sources/dosfstools-2.10.src.tar.gz
>   
Ok with this source (could never test with the original source) I get 
this compile error

make -C mkdosfs all
make[1]: Entering directory 
`/var/src/openembedded/tmp/work/i686-linux/dosfstools-native-2.10-r3/dosfstools-2.10/mkdosfs'
ccache gcc -isystem/var/src/openembedded/tmp/staging/i686-linux/include 
-O2 -c mkdosfs.c -o mkdosfs.o
mkdosfs.c:129: error: expected declaration specifiers or '...' before 
'_llseek'
mkdosfs.c:129: error: expected declaration specifiers or '...' before 'fd'
mkdosfs.c:129: error: expected declaration specifiers or '...' before 'hi'
mkdosfs.c:129: error: expected declaration specifiers or '...' before 'lo'
mkdosfs.c:130: error: expected declaration specifiers or '...' before 'res'
mkdosfs.c:130: error: expected declaration specifiers or '...' before 'wh'
make[1]: *** [mkdosfs.o] Error 1
make[1]: Leaving directory 
`/var/src/openembedded/tmp/work/i686-linux/dosfstools-native-2.10-r3/dosfstools-2.10/mkdosfs'
make: *** [all] Error 2
+ die 'oe_runmake failed'
+ oefatal 'oe_runmake failed'
+ echo FATAL: 'oe_runmake failed'
FATAL: oe_runmake failed
+ exit 1
ERROR: Function do_compile failed


regards
Patrick


