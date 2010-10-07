Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P3sV5-0001zX-IC for openembedded-devel@lists.openembedded.org;
	Thu, 07 Oct 2010 17:35:19 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P3sUj-0003yi-CD for openembedded-devel@lists.openembedded.org;
	Thu, 07 Oct 2010 17:34:57 +0200
Received: from d75-157-18-211.bchsia.telus.net ([75.157.18.211])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Oct 2010 17:34:57 +0200
Received: from dfoley by d75-157-18-211.bchsia.telus.net with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Oct 2010 17:34:57 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: dfoley <dfoley@telus.net>
Date: Thu, 07 Oct 2010 08:34:47 -0700
Message-ID: <4CADE897.5070307@telus.net>
References: <AANLkTikzKs+3U0JfEbQxg5dLVuMF51To2qTn55YLOmjg@mail.gmail.com>	<20101005123257.GD3517@excalibur.local>	<4CAB3B4D.9000007@telus.net>
	<20101006103731.GG3517@excalibur.local>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: d75-157-18-211.bchsia.telus.net
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.12) Gecko/20100915 Thunderbird/3.0.8
In-Reply-To: <20101006103731.GG3517@excalibur.local>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing 2010-10-04
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
X-List-Received-Date: Thu, 07 Oct 2010 15:35:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10-10-06 03:37 AM, Stefan Schmidt wrote:
> Hello.
>
> On Tue, 2010-10-05 at 07:50, dfoley wrote:
>>
>> May not be correct, but I ran into the same problem and patched.
>>
>> diff --git a/recipes/cacao/cacao.inc b/recipes/cacao/cacao.inc
>> index c366b74..70bda75 100644
>> --- a/recipes/cacao/cacao.inc
>> +++ b/recipes/cacao/cacao.inc
>> @@ -23,7 +23,7 @@ EXTRA_OECONF = "\
>>   	${@['','--enable-softfloat'][bb.data.getVar('TARGET_FPU',d,1) == 'soft']} \
>>   	--enable-debug \
>>   	--with-vm-zip=${datadir}/cacao/vm.zip \
>> -	--with-cacaoh=${STAGING_BINDIR_NATIVE}/cacaoh-${PV} \
>> +	--with-cacaoh=${STAGING_BINDIR_NATIVE}/cacaoh-${PV}/cacaoh \
>>       --with-build-java-runtime-library-classes=${STAGING_DATADIR}/classpath/glibj.zip \
>>       --with-java-runtime-library-classes=${datadir}/classpath/glibj.zip \
>>       --with-java-runtime-library-libdir=${libdir_jni}:${libdir} \
>
> This does it fix for me as well. I wonder from which commit the  directory
> change was triggered in the last week.
>
> Care to send a git formatted patch with PR bump I could apply? As you did the
> work you should get the credits for it. :)
>
> regards
> Stefan Schmidt

I don't mind if you commit it. You can put me in signed off by.
Should the maintainer (MAINTAINERS file) verify it ?



