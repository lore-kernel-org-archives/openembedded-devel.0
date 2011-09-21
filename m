Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R6Rsd-0001lK-J2
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Sep 2011 20:50:47 +0200
Received: by wyh5 with SMTP id 5so2529208wyh.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Sep 2011 11:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:newsgroups:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=AFQYu1kHyieZlsPC7lJyxofMUH/CPavx2bJkahCvHtk=;
	b=X2+uYT2iZW3roJxJY1tNYF5W4Yjr0L0ikq7P+m5rKFBfDVxw7KGLVjFpO1ngsTJp6I
	i5Cah5CLlsYtGV1Qayg9F7ba0aL5Apn4v1EI/C7AQCM4HZbmB5sqeBR3QbdXHuTVFygt
	mtZMfw6GgkTemS4uA6T0tR6u+ExfWbvGLQkUA=
Received: by 10.227.208.137 with SMTP id gc9mr1091374wbb.91.1316630728467;
	Wed, 21 Sep 2011 11:45:28 -0700 (PDT)
Received: from [137.202.140.192] (nat-rup.mentorg.com. [139.181.168.34])
	by mx.google.com with ESMTPS id o7sm7968399wbh.8.2011.09.21.11.45.26
	(version=SSLv3 cipher=OTHER); Wed, 21 Sep 2011 11:45:26 -0700 (PDT)
Message-ID: <4E7A309A.8060300@gmail.com>
Date: Wed, 21 Sep 2011 22:44:42 +0400
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.21) Gecko/20110831 Iceowl/1.0b2 Icedove/3.1.13
MIME-Version: 1.0
Newsgroups: gmane.comp.handhelds.openembedded
To: openembedded-devel@lists.openembedded.org
References: <1316384018-7651-1-git-send-email-dbaryshkov@gmail.com>	<j56n5t$s0d$2@dough.gmane.org>
	<j57i4p$i51$1@dough.gmane.org>	<j57inn$mme$1@dough.gmane.org>
	<20110919143959.GC19168@jama.jama.net>
In-Reply-To: <20110919143959.GC19168@jama.jama.net>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [meta-oe][V3] openssl: fixup the openssl-fix-link patch
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
X-List-Received-Date: Wed, 21 Sep 2011 18:50:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Koen, please doublecheck your setup. Today I've just rebuilt 
openssl-native with this patch and it worked. Did you clean/cleansstate 
before rechecking the patch?

On 09/19/2011 06:39 PM, Martin Jansa wrote:
> On Mon, Sep 19, 2011 at 04:14:15PM +0200, Koen Kooi wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> Op 19-09-11 16:03, Dmitry Eremin-Solenikov schreef:
>>> On 09/19/2011 10:23 AM, Koen Kooi wrote:
>>>> -----BEGIN PGP SIGNED MESSAGE----- Hash: SHA1
>>>>
>>>> Op 19-09-11 00:13, Dmitry Eremin-Solenikov schreef:
>>>>> Include more dependencies into openssl-fix-link.patch patch.
>>>>>
>>>>> Signed-off-by: Dmitry Eremin-Solenikov<dbaryshkov@gmail.com>   ---
>>>>> .../openssl/openssl-1.0.0e/openssl-fix-link.patch  |   22
>>>>> +++++++++++--------
>>>>> .../recipes-connectivity/openssl/openssl_1.0.0e.bb | 2 +- 2 files
>>>>> changed, 14 insertions(+), 10 deletions(-)
>>>>
>>>>
>>>> I still get: NOTE: package openssl-native-1.0.0e-r13.1: task do_patch:
>>>> Failed
>>>
>>> Strange. Please check: md5sum
>>> sources/meta-openembedded/meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/openssl-fix-link.patch
>>>
>>>
>>>
>> 03c99586e59ea5a25e0598c7419d8aff
>>> sources/meta-openembedded/meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/openssl-fix-link.patch
>>>
>>>
>>>
>> koen@dominion:/OE/tentacle/sources/meta-openembedded/meta-oe$ md5sum
>> recipes-connectivity/openssl/openssl-1.0.0e/openssl-fix-link.patch
>> 03c99586e59ea5a25e0598c7419d8aff
>> recipes-connectivity/openssl/openssl-1.0.0e/openssl-fix-link.patch
>> -----BEGIN PGP SIGNATURE-----
>> Version: GnuPG v1.4.5 (Darwin)
>>
>> iD8DBQFOd043MkyGM64RGpERAnKnAJwJMqWQhqhqLYRycKAmkAwzOvMHoACeP2Xm
>> F2AqsDz4e8AzU6FRz5po5Fk=
>> =Snrw
>> -----END PGP SIGNATURE-----
>
> FWIW:
>
> OE spitz@shr ~/shr-core/meta-openembedded $ ~/oe/contrib/patchwork/pw-am.sh 11669
> 2011-09-19 16:17:30 URL:http://patches.openembedded.org/patch/11669/mbox/ [2673] ->  "pw-am-11669.patch" [1]
> Applying: openssl: fixup the openssl-fix-link patch
> /OE/shr-core/meta-openembedded/.git/rebase-apply/patch:19: space before tab in indent.
>          @dir=crypto; target=all; $(BUILD_ONE_CMD)
> /OE/shr-core/meta-openembedded/.git/rebase-apply/patch:22: space before tab in indent.
>          @dir=ssl; target=all; $(BUILD_ONE_CMD)
> /OE/shr-core/meta-openembedded/.git/rebase-apply/patch:26: space before tab in indent.
>          @dir=engines; target=all; $(BUILD_ONE_CMD)
> /OE/shr-core/meta-openembedded/.git/rebase-apply/patch:33: space before tab in indent.
>          @dir=apps; target=all; $(BUILD_ONE_CMD)
> /OE/shr-core/meta-openembedded/.git/rebase-apply/patch:36: space before tab in indent.
>          @dir=test; target=all; $(BUILD_ONE_CMD)
> warning: squelched 1 whitespace error
> warning: 6 lines add whitespace errors.

logical 'errors'. space required by patch format and then a tab from a 
makefile.

>
> ...
> 03c99586e59ea5a25e0598c7419d8aff  meta-openembedded/meta-oe/recipes-connectivity/openssl/openssl-1.0.0e/openssl-fix-link.patch
> ...
>
> NOTE: Resolving any missing task queue dependencies
> NOTE: Preparing runqueue
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> NOTE: Running task 731 of 958 (ID: 4, virtual:native:/OE/shr-core/meta-openembedded/meta-oe/recipes-connectivity/openssl/openssl_1.0.0e.bb, do_fetch)
> NOTE: Running task 885 of 958 (ID: 18, /OE/shr-core/meta-openembedded/meta-oe/recipes-connectivity/openssl/openssl_1.0.0e.bb, do_fetch)
> NOTE: package openssl-native-1.0.0e-r13.1: task do_fetch: Started
> NOTE: package openssl-native-1.0.0e-r13.1: task do_fetch: Succeeded
> NOTE: package openssl-1.0.0e-r13.1: task do_fetch: Started
> NOTE: package openssl-1.0.0e-r13.1: task do_fetch: Succeeded
> NOTE: Running task 886 of 958 (ID: 0, virtual:native:/OE/shr-core/meta-openembedded/meta-oe/recipes-connectivity/openssl/openssl_1.0.0e.bb, do_unpack)
> NOTE: Running task 887 of 958 (ID: 14, /OE/shr-core/meta-openembedded/meta-oe/recipes-connectivity/openssl/openssl_1.0.0e.bb, do_unpack)
> NOTE: package openssl-1.0.0e-r13.1: task do_unpack: Started
> NOTE: package openssl-native-1.0.0e-r13.1: task do_unpack: Started
> NOTE: package openssl-1.0.0e-r13.1: task do_unpack: Succeeded
> NOTE: Running task 888 of 958 (ID: 15, /OE/shr-core/meta-openembedded/meta-oe/recipes-connectivity/openssl/openssl_1.0.0e.bb, do_patch)
> NOTE: package openssl-native-1.0.0e-r13.1: task do_unpack: Succeeded
> NOTE: Running task 889 of 958 (ID: 1, virtual:native:/OE/shr-core/meta-openembedded/meta-oe/recipes-connectivity/openssl/openssl_1.0.0e.bb, do_patch)
> NOTE: package openssl-1.0.0e-r13.1: task do_patch: Started
> NOTE: package openssl-native-1.0.0e-r13.1: task do_patch: Started
> NOTE: package openssl-1.0.0e-r13.1: task do_patch: Succeeded
> NOTE: package openssl-native-1.0.0e-r13.1: task do_patch: Succeeded

-- 
With best wishes
Dmitry


