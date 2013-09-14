Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 27FD560EDA
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Sep 2013 08:37:34 +0000 (UTC)
Message-ID: <5234204D.9050904@communistcode.co.uk>
Date: Sat, 14 Sep 2013 09:37:33 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130806 Thunderbird/17.0.8
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1379110532-29457-1-git-send-email-ml@communistcode.co.uk>
	<CAP9ODKrVsBfpHDtwp031feCOitJEG6fi=bKah4e0sH5_Wkh6cg@mail.gmail.com>
In-Reply-To: <CAP9ODKrVsBfpHDtwp031feCOitJEG6fi=bKah4e0sH5_Wkh6cg@mail.gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCHv5] libsoc: new recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 14 Sep 2013 08:37:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/13/13 23:22, Otavio Salvador wrote:
> On Fri, Sep 13, 2013 at 7:15 PM, Jack Mitchell <ml@communistcode.co.uk> wrote:
>> From: Jack Mitchell <jack@embed.me.uk>
>>
>> Signed-off-by: Jack Mitchell <jack@embed.me.uk>
> ...
>
> The recipe is clean now ... but ...
>
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/libsoc/libsoc_0.3.bb
>> @@ -0,0 +1,14 @@
>> +SUMMARY = "libsoc is a C library for interfacing with common SoC peripherals through generic kernel interfaces"
>> +HOMEPAGE = "https://github.com/jackmitch/libsoc"
>> +
>> +LICENSE = "LGPLv2.1"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=e0bfebea12a718922225ba987b2126a5"
>> +
>> +inherit autotools
>> +
>> +SRCREV = "0764ee52b590d5ccb4bd4698f0011496b536ed70"
>> +SRC_URI = "git://github.com/jackmitch/libsoc.git"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +RDEPENDS_${PN} = "libgcc"
> I am a little concerned /why/ this is need. Your code seems quite
> simple and I don't understand why this special need. Did you try to
> install and use it without this RDEPENDS ? It should work just fine.
>

There seems to be a bug with the eglibc recipe as noted in a previous 
discussion [1] where pthreads requires libgcc.so to be available but it 
isn't pulled in as a requirement. Now, I believe this goes largly 
unnoticed as there are very few functions which actually require the 
libgcc.so lib, but it happens that one of the functions I use 
(pthread_cancel), does require it, so I run into this bug and as such 
have to depened on RDEPENDS = "libgcc" in order to ensure it is in the 
rootfs.

In the next version of the library I think I am going to see if I can 
work round using pthread_cancel in favour of a less awkward function.

Cheers,
Jack.

[1] http://comments.gmane.org/gmane.comp.handhelds.openembedded.core/37086


