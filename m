Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L638P-0003Es-MT
	for openembedded-devel@openembedded.org; Fri, 28 Nov 2008 14:11:49 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1L635K-0007uI-Qt
	for openembedded-devel@openembedded.org; Fri, 28 Nov 2008 13:08:38 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 28 Nov 2008 13:08:38 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 28 Nov 2008 13:08:38 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 28 Nov 2008 14:08:28 +0100
Message-ID: <ggoqgc$2qq$1@ger.gmane.org>
References: <20081128090350.6D9BC1893B2@amethyst.openembedded.net>
	<492FE697.7000201@gmx.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081120 Shredder/3.0b1pre
In-Reply-To: <492FE697.7000201@gmx.net>
Sender: news <news@ger.gmane.org>
Subject: Re: [oe-commits] Koen Kooi : vlc: update 0.9.4 to 0.9.6 to get rid of the "version <foo> has vulnerabilities" nag screen
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
X-List-Received-Date: Fri, 28 Nov 2008 13:11:49 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28-11-08 13:39, Robert Schuster wrote:
> Hi Koen,
>
> GIT User account schrieb:
>> vlc: update 0.9.4 to 0.9.6 to get rid of the "version<foo>  has vulnerabilities" nag screen
>
> your patch contains undocumented changes - see below. I find it hard to
> see from the diff whether you just upgraded the vlc 0.9.4 entries to
> 0.9.6 or if more was changed.

It's the result of running the sorter over the checksums file

regards,

Koen

>
> Regards
> Robert
>
>>   conf/checksums.ini                          |   59 ++++++++++++++------------
>>   packages/vlc/{vlc_0.9.4.bb =>  vlc_0.9.6.bb} |    4 +-
>>   2 files changed, 33 insertions(+), 30 deletions(-)
>>
>> diff --git a/conf/checksums.ini b/conf/checksums.ini
>> index 20f4660..1914ab7 100644
>> --- a/conf/checksums.ini
>> +++ b/conf/checksums.ini
>> @@ -1,27 +1,3 @@
>> -[http://downloads.sourceforge.net/blackboxwm/blackbox-0.70.1.tar.gz]
>> -md5=2d173b95ca5e64ef478c6a5d2deee9df
>> -sha256=e394561d4426cf17e21eb5cc32e2972eb1af92d04a41808a41b1fb95320bd659
>> -
>> -[ftp://ftp.xfree86.org/pub/XFree86/4.3.0/source/X430src-1.tgz]
>> -md5=4f241a4f867363f40efa2b00dca292af
>> -sha256=5276b045e154948fce7abba7d686406c65862d90b43b50f2546b33e38378f0d7
>> -
>> -[ftp://ftp.xfree86.org/pub/XFree86/4.3.0/source/X430src-2.tgz]
>> -md5=844c2ee908d21dbf8911fd13115bf8b4
>> -sha256=0afbf41d0f4bcaceb1381fc1882b80f62548845b85c83c3eb0f3a9ac7f7f96ef
>> -
>> -[ftp://ftp.xfree86.org/pub/XFree86/4.3.0/source/X430src-3.tgz]
>> -md5=b82a0443e1b7bf860e4343e6b6766cb6
>> -sha256=19a830e3657851ad575ca895eb59932f1d90cd03735dec68f900dbc1bb6c3b7f
>> -
>> -[ftp://ftp.xfree86.org/pub/XFree86/4.3.0/source/X430src-4.tgz]
>> -md5=567903747018f2534965ab6cb3976b38
>> -sha256=f62081c6f8a70a35fb0b5b210329f6bba7f5e506e9b809e23ceba21a2c35278e
>> -
>> -[ftp://ftp.xfree86.org/pub/XFree86/4.3.0/source/X430src-5.tgz]
>> -md5=4dbdbe9a85c8f7f98dd0ee015a3c7b4f
>> -sha256=3b732ed179dd34c17d1ba17867b60a36f20d82a3f0eca7b084fcb5396aa2b30c
>> -
>>   [http://www.directfb.org/downloads/Extras/++DFB-0.9.25.tar.gz]
>>   md5=c6a2705f6210d8ede50a947b375f1c0b
>>   sha256=b3dbf01563dd60d63cff543ea8cd0c885381e78ecbbab8ff176e46df3f198a88
>> @@ -838,22 +814,42 @@ sha256=3d92318dadef22b1d1b062925ef66bac2ad48a0fd4fc83b88dcabba38c182b7b
>>   md5=61eed8ed819688663e399b5e79ed006f
>>   sha256=6a19418a074a7dec6fd67f00df74f3335e85eb38d2d2a17bd0e91cf8010537e3
>>
>> +[ftp://ftp.xfree86.org/pub/XFree86/4.3.0/source/X430src-1.tgz]
>> +md5=4f241a4f867363f40efa2b00dca292af
>> +sha256=5276b045e154948fce7abba7d686406c65862d90b43b50f2546b33e38378f0d7
>> +
>>   [http://ring.asahi-net.or.jp/archives/XFree86/4.3.0/source/X430src-1.tgz]
>>   md5=4f241a4f867363f40efa2b00dca292af
>>   sha256=5276b045e154948fce7abba7d686406c65862d90b43b50f2546b33e38378f0d7
>>
>> +[ftp://ftp.xfree86.org/pub/XFree86/4.3.0/source/X430src-2.tgz]
>> +md5=844c2ee908d21dbf8911fd13115bf8b4
>> +sha256=0afbf41d0f4bcaceb1381fc1882b80f62548845b85c83c3eb0f3a9ac7f7f96ef
>> +
>>   [http://ring.asahi-net.or.jp/archives/XFree86/4.3.0/source/X430src-2.tgz]
>>   md5=844c2ee908d21dbf8911fd13115bf8b4
>>   sha256=0afbf41d0f4bcaceb1381fc1882b80f62548845b85c83c3eb0f3a9ac7f7f96ef
>>
>> +[ftp://ftp.xfree86.org/pub/XFree86/4.3.0/source/X430src-3.tgz]
>> +md5=b82a0443e1b7bf860e4343e6b6766cb6
>> +sha256=19a830e3657851ad575ca895eb59932f1d90cd03735dec68f900dbc1bb6c3b7f
>> +
>>   [http://ring.asahi-net.or.jp/archives/XFree86/4.3.0/source/X430src-3.tgz]
>>   md5=b82a0443e1b7bf860e4343e6b6766cb6
>>   sha256=19a830e3657851ad575ca895eb59932f1d90cd03735dec68f900dbc1bb6c3b7f
>>
>> +[ftp://ftp.xfree86.org/pub/XFree86/4.3.0/source/X430src-4.tgz]
>> +md5=567903747018f2534965ab6cb3976b38
>> +sha256=f62081c6f8a70a35fb0b5b210329f6bba7f5e506e9b809e23ceba21a2c35278e
>> +
>>   [http://ring.asahi-net.or.jp/archives/XFree86/4.3.0/source/X430src-4.tgz]
>>   md5=567903747018f2534965ab6cb3976b38
>>   sha256=f62081c6f8a70a35fb0b5b210329f6bba7f5e506e9b809e23ceba21a2c35278e
>>
>> +[ftp://ftp.xfree86.org/pub/XFree86/4.3.0/source/X430src-5.tgz]
>> +md5=4dbdbe9a85c8f7f98dd0ee015a3c7b4f
>> +sha256=3b732ed179dd34c17d1ba17867b60a36f20d82a3f0eca7b084fcb5396aa2b30c
>> +
>>   [http://ring.asahi-net.or.jp/archives/XFree86/4.3.0/source/X430src-5.tgz]
>>   md5=4dbdbe9a85c8f7f98dd0ee015a3c7b4f
>>   sha256=3b732ed179dd34c17d1ba17867b60a36f20d82a3f0eca7b084fcb5396aa2b30c
>> @@ -2074,6 +2070,10 @@ sha256=ac6a5c3f4aa88f39e8f04fe43f00972f0235674ac3edb994c70ac802a1ed0219
>>   md5=5a6228512bcce7d9fabe8fc2d66269bf
>>   sha256=5cd1a5aeace83a9305f7221e9ec95127b5a26870c619fd00ae48f1962d59f48b
>>
>> +[http://downloads.sourceforge.net/blackboxwm/blackbox-0.70.1.tar.gz]
>> +md5=2d173b95ca5e64ef478c6a5d2deee9df
>> +sha256=e394561d4426cf17e21eb5cc32e2972eb1af92d04a41808a41b1fb95320bd659
>> +
>>   [http://heanet.dl.sourceforge.net/blackboxwm/blackbox-0.70.1.tar.gz]
>>   md5=2d173b95ca5e64ef478c6a5d2deee9df
>>   sha256=e394561d4426cf17e21eb5cc32e2972eb1af92d04a41808a41b1fb95320bd659
>> @@ -12782,6 +12782,10 @@ sha256=d26a1de101692958fbca1d1be40fe52bd605636baea616a3e8ed96e422a3648d
>>   md5=3f23ad4b69d0a552042d1ed0f4399857
>>   sha256=413c64fbbcf81244cb5571be4963644a1e81166a2b0f008a016528363b65c5d3
>>
>> +[http://kernel.orgpub/linux/kernel/v2.6/linux-2.6.24.tar.bz2]
>> +md5=3f23ad4b69d0a552042d1ed0f4399857
>> +sha256=413c64fbbcf81244cb5571be4963644a1e81166a2b0f008a016528363b65c5d3
>> +
>>   [http://www.kernel.org/pub/linux/kernel/v2.6/linux-2.6.24.tar.bz2]
>>   md5=3f23ad4b69d0a552042d1ed0f4399857
>>   sha256=413c64fbbcf81244cb5571be4963644a1e81166a2b0f008a016528363b65c5d3
>> @@ -20062,6 +20066,10 @@ sha256=b839353694fa5d47b8874573525a6612ce22654774c7cd2d9d4a16f7044b7854
>>   md5=786628aaf8f30a9b812975b67c88b971
>>   sha256=6e6ce0fc497d380b3ed1b8c77c4ce5d089a90070ef38626b9af71a13e52b4faf
>>
>> +[http://download.videolan.org/pub/videolan/vlc/0.9.6/vlc-0.9.6.tar.bz2]
>> +md5=cd71276ed867029a6d077a40bccd4d05
>> +sha256=ac091ba9b2e2e9aff293969b3405b145c09789e59ac0caab2247211a19e09a8a
>> +
>>   [http://194.213.43.198/vmedit/vmedit-0.02.tar.gz]
>>   md5=7550ea1dd951d2f7fb1a54caa88860b2
>>   sha256=bca8b0073d9527c0293b831c9b8d8f89fc3dc7b5ab30898e7b748843af07a978
>> @@ -23538,6 +23546,3 @@ sha256=5cc1a53bb909922596bdd0fa967b654fe1bfbe0dcf1d34608f0b7c90e0c27867
>>   md5=5f7b88ebb2bcd7e8044328482d079661
>>   sha256=f57c4e33eb2cdd87a6c2f01bfa4794340fbe61ea1a1cfc7dac3b6671e1dd22af
>>
>> -[http://kernel.orgpub/linux/kernel/v2.6/linux-2.6.24.tar.bz2]
>> -md5=3f23ad4b69d0a552042d1ed0f4399857
>> -sha256=413c64fbbcf81244cb5571be4963644a1e81166a2b0f008a016528363b65c5d3
>
>
>
> ------------------------------------------------------------------------
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




