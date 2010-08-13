Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1Ok0nH-0003d9-N0
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Aug 2010 22:24:45 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1Ok0mt-0007Je-2M from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Aug 2010 13:23:35 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Fri, 13 Aug 2010 13:23:34 -0700
Received: from [172.30.80.96] ([172.30.80.96]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 13 Aug 2010 14:23:33 -0600
Message-ID: <4C65A9BD.9010105@mentor.com>
Date: Fri, 13 Aug 2010 13:23:25 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1281698231-26231-1-git-send-email-noor_ahsan@mentor.com>	<1281701005.3858.129.camel@mattotaupa>	<AANLkTinLVmyz+QJQKXRcmf-1375uTPC84RYM8Xr59V3-@mail.gmail.com>
	<i43kf7$942$1@dough.gmane.org>
In-Reply-To: <i43kf7$942$1@dough.gmane.org>
X-OriginalArrivalTime: 13 Aug 2010 20:23:33.0889 (UTC)
	FILETIME=[670C7710:01CB3B25]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH]Removing Legacy staging from genboot native recipe
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
X-List-Received-Date: Fri, 13 Aug 2010 20:24:45 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 13-08-10 14:25, Frans Meulenbroeks wrote:
>> 2010/8/13 Paul Menzel <paulepanter@users.sourceforge.net>:
>>> Am Freitag, den 13.08.2010, 17:17 +0600 schrieb noor_ahsan@mentor.com:
> 
>>>> +NATIVE_INSTALL_WORKS = "1"
>>> I am really a noob, but is not that for “normal”, i.e. no *-native,
>>> recipes indicating no explicit native recipe is needed?
>> Afaik this is not needed.
> 
> If your -native recipe has something different than 'make install' in
> do_install, it needs NATIVE_INSTALL_WORKS = "1" but only if you use
> BBCLASSEXTEND to make it native.

Sounds like a tip for 
http://wiki.openembedded.org/index.php/Legacy_staging (which Noor and 
some other folks here have been looking at).  Thanks? :)

-- 
Tom Rini
Mentor Graphics Corporation


