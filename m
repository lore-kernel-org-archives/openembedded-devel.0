Return-Path: <prvs=7372357f8=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 08FA373CC7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 15:50:22 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AmIGABI/MlasEApK/2dsb2JhbABehHgGuwOGCYYZAoF7AQEBAQEBgQtBEwGDYQEBBHgRCw0LCRYPCQMCAQIBDzYGDQYCAogXAxfBBw2EOwEBCCOGd4N4gQaCU4F7SReEFgWNG4koiy4Biw8XizWHUYMngUFxggmCLUGBBwEBAQ
X-IPAS-Result: AmIGABI/MlasEApK/2dsb2JhbABehHgGuwOGCYYZAoF7AQEBAQEBgQtBEwGDYQEBBHgRCw0LCRYPCQMCAQIBDzYGDQYCAogXAxfBBw2EOwEBCCOGd4N4gQaCU4F7SReEFgWNG4koiy4Biw8XizWHUYMngUFxggmCLUGBBwEBAQ
Message-ID: <56324006.8040905@skidata.com>
Date: Thu, 29 Oct 2015 16:49:26 +0100
From: Richard Leitner <richard.leitner@skidata.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <D1946B41-2BFF-49FA-A4C7-19A2A1D6C731@gmail.com>
	<5631CDAD.7030703@skidata.com>
	<A34BC9F8-F519-435B-B65A-26A533F78877@gmail.com>
	<CAP9ODKrh9kxCTf3es2Oypx3rPNiKp9Fb3Nk6xafgrc=R+JEkwg@mail.gmail.com>
	<9E01DDA7-C832-4E17-B17A-25850D0B27B5@gmail.com>
	<563208F3.1040900@skidata.com>
	<CAP9ODKoUv+-WXzXNEKdFWwFDbJnQGXZtiZzqXtBzS7MmwOXkYA@mail.gmail.com>
In-Reply-To: <CAP9ODKoUv+-WXzXNEKdFWwFDbJnQGXZtiZzqXtBzS7MmwOXkYA@mail.gmail.com>
X-Originating-IP: [172.16.60.30]
Subject: Re: [meta-java][PATCH 4/4] openjdk-8: add recipes for openjdk-8 and openjre-8
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
X-List-Received-Date: Thu, 29 Oct 2015 15:50:23 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 10/29/2015 01:24 PM, Otavio Salvador wrote:
> On Thu, Oct 29, 2015 at 9:54 AM, Richard Leitner
> <richard.leitner@skidata.com> wrote:
>> On 10/29/2015 12:24 PM, Jens Rehsack wrote:
>>>
>>>> Am 29.10.2015 um 11:46 schrieb Otavio Salvador <otavio.salvador@ossystems.com.br>:
>>>>
>>>> On Thu, Oct 29, 2015 at 7:22 AM, Jens Rehsack <rehsack@gmail.com> wrote:
>>>>>> Am 29.10.2015 um 08:41 schrieb Richard Leitner <richard.leitner@skidata.com>:
>>>>>> To cite Otavio:
>>>>>> We could rename the patches directory for openjdk-7 and avoid the
>>>>>> version number on it. This would make easier for upgrades and to see
>>>>>> the diff between the patches.
>>>>>
>>>>> So git diff -M doesn't work for you? I don't understand the reasoning.
>>>>
>>>> It does but reusing the directory easy the upgrade and as the
>>>> openjdk-8 is in maintenance it is expected that it does not change
>>>> much in the patches.
>>>
>>> Partial. As I told you, I updated OpenJDK from 8u40 to 8u72 when I first
>>> encountered massive crashes on the target device with zeroshark until
>>> llvm guys told me, that legacy JIT for ARM was utterly broken and they
>>> force people to MCJIT.
>>>
>>> Having both directories during the upgrade helped me massively to
>>> avoid breaking patches by fixing against new upstream adoptions.
>>>
>>> Surely, this could be handled developer-side by keeping an foo.old
>>> directory - but it smells the same smell ;)
>>>
>>> I don't fight against renaming the directory, I just argue, both
>>> way have their own kind of smell.
>>>
>>
>> I really understand both sides... But for me, due to the fact we want to
>> support only one version of each OpenJDK release, the patch directory
>> without version has "a better smell" ;-)
>>
>> I would also go one step further and omit the version from
>> openjdk-7-release-*.inc. Then the version number is only included in the
>> name of the openjdk-7_*.bb file.
>>
>> But I'm open to any discussion! So what do you think about it?
> 
> I agree; and if we possible fix the indenting and reduce the
> indirection (reducing the number .inc files, for example) I would
> support :-D
> 

Ok, i will prepare a patch for fixing the filenames in openjdk-7.

What indentation should be chosen? Tabs? Spaces (how much)?
Maybe I have also time to fix that in the recipes-core.

best regards;
Richard L

