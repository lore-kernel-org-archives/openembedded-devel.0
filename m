Return-Path: <prvs=7422397a9=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 8BC1071633
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Nov 2015 15:42:02 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AmYGAF/VOFasEApK/2dsb2JhbABehA5vBrsfhBUjhTc6AoIGAQEBAQEBgQtBEwGDYQEBBHgRCw0LCRYPCQMCAQIBRQYNBgICiC8IwVcBAQEBBgEBAQEbBIZkhH6ENQYBAWqEFAWHQYcLh3qFHZEgF5MNhGhxBYIEgiwIOoEHAQEB
X-IPAS-Result: AmYGAF/VOFasEApK/2dsb2JhbABehA5vBrsfhBUjhTc6AoIGAQEBAQEBgQtBEwGDYQEBBHgRCw0LCRYPCQMCAQIBRQYNBgICiC8IwVcBAQEBBgEBAQEbBIZkhH6ENQYBAWqEFAWHQYcLh3qFHZEgF5MNhGhxBYIEgiwIOoEHAQEB
Message-ID: <5638D571.3090500@skidata.com>
Date: Tue, 3 Nov 2015 16:40:33 +0100
From: Richard Leitner <richard.leitner@skidata.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <AE55B37B-BC8F-4516-82BC-B2B1DE341859@gmail.com>
	<5638C28E.7040505@skidata.com>
	<2BAA39D9-E6DA-403E-AFAB-1E59CFE61DF2@gmail.com>
In-Reply-To: <2BAA39D9-E6DA-403E-AFAB-1E59CFE61DF2@gmail.com>
X-Originating-IP: [172.16.60.30]
Subject: Re: [meta-java][PATCH] openjdk-8: add recipes for openjdk-8 and openjre-8
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
X-List-Received-Date: Tue, 03 Nov 2015 15:42:04 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 11/03/2015 03:54 PM, Jens Rehsack wrote:
> 
>> Am 03.11.2015 um 15:19 schrieb Richard Leitner <richard.leitner@skidata.com>:
>>
>> On 11/03/2015 10:36 AM, Jens Rehsack wrote:
>>> This adds openjdk-8 for native and target builds and allows a stripped
>>> openjre-8 being built as well instead of trying to cherry-pick jre
>>> components from jdk-image.
>>>
>>> The recipes allow building openjdk-8 with or without:
>>> * x11
>>> * cups
>>> * alsa/pulseaudio
>>> and let packager enable unlimited-crypto, if desired.
>>>
>>> Since there can be only one PROVIDES for virtual/java-native and virtual/javac-native,
>>> move the provides to openjdk-8-native (I think everyone agrees it's a better
>>> choice than ecj-bootstrap-native).
>>>
>>> Plus: Applying a fix from openjdk-9 repository which fixes build issues using gcc5
>>
>> For me the patch fails to apply on current master:
>>
>> git am patches-from-emails/openjdk-8_and_openjre-8.eml
>> Applying: openjdk-8: add recipes for openjdk-8 and openjre-8
>> /home/leri/git/meta-java/.git/rebase-apply/patch:515: trailing whitespace.
>>      xargs -0 -n1
>> ${STAGING_LIBDIR_NATIVE}/jvm/openjdk-8-native/bin/pack200 --repack
>> --effort=9 --segment-limit=-1 --modification-time=latest --strip-debug
>> /home/leri/git/meta-java/.git/rebase-apply/patch:1232: trailing whitespace.
>> #
>> /home/leri/git/meta-java/.git/rebase-apply/patch:1265: trailing whitespace.
>>
>> /home/leri/git/meta-java/.git/rebase-apply/patch:1270: trailing whitespace.
>>
>> /home/leri/git/meta-java/.git/rebase-apply/patch:1289: trailing whitespace.
>>
>> fatal: corrupt patch at line 4592
>> Patch failed at 0001 openjdk-8: add recipes for openjdk-8 and openjre-8
> 
> That's maybe because I copy the format-patch output manually into the mail.
> Use this one: https://github.com/rehsack/meta-java/commit/57eba04b0f68a55b3250a692bc5834902709c903
> 

Same error :-(
Do I need any previous patches applied which are not yet on master?

kind regards;
Richard L

