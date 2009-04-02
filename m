Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LpROu-0001sG-FK
	for openembedded-devel@openembedded.org; Thu, 02 Apr 2009 20:12:33 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1LpRMY-0000cV-Bp
	for openembedded-devel@openembedded.org; Thu, 02 Apr 2009 18:10:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 02 Apr 2009 18:10:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 02 Apr 2009 18:10:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 02 Apr 2009 20:07:54 +0200
Message-ID: <gr2utq$hj4$2@ger.gmane.org>
References: <1238607343.27167.1.camel@homestead>	<49D44D76.7070808@bolloretelecom.eu>
	<be7a9f3d0904020944h4d4c6d6dgac1a2e75163d8cf3@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090328 Shredder/3.0b3pre
In-Reply-To: <be7a9f3d0904020944h4d4c6d6dgac1a2e75163d8cf3@mail.gmail.com>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW, RDNS_NONE, SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: cmake
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
X-List-Received-Date: Thu, 02 Apr 2009 18:12:36 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02-04-09 18:44, Otavio Salvador wrote:
> On Thu, Apr 2, 2009 at 2:30 AM, Jeremy Lainé
> <jeremy.laine@bolloretelecom.eu>  wrote:
>> Shane Dixon wrote:
>>> I'm considering changing my projects over to cmake, but before I do, I
>>> wanted to ask how good the cmake support is in OE.  I saw a recent
>>> proposal to allow out-of-tree builds for cmake, but I'm not sure if that
>>> happened or not.
>>
>> At work we recently switched our projects over to CMake and they are building happily in
>> OE. Out-of-tree builds are indeed supported, see recipes/llvm/llvm.inc for an example.
>
> What do you mean by out-of-tree?

S=work/foo-1.2-r0/foo-1.2/
B=work/foo-1.2-r0/build-foo-1.2

All generated stuff (makefiles, objects, binaries, etc) will end up in B 
so that S stays clean.

I'd like out-of-tree builds to be the default for autotools and cmake, 
but there are way too many broken autofoo and cmake using packages out 
there :(

regards,

Koen




