Return-Path: <magnus@minimum.se>
Received: from mail.glesys.se (mail.glesys.se [195.238.77.166])
	by mail.openembedded.org (Postfix) with ESMTP id 596A473A1E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2015 14:45:19 +0000 (UTC)
Received: from lightmail.glesys.com (smtpout.glesys.se [79.99.4.40])
	by mail.glesys.se (Postfix) with ESMTP id E0260600E65
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2015 15:42:23 +0100 (CET)
Received: from 94.254.110.79
	(SquirrelMail authenticated user magnus@minimum.se)
	by lightmail.glesys.com with HTTP; Tue, 10 Mar 2015 15:54:56 +0100
Message-ID: <3cca049f035271caa753ba240c184793.squirrel@lightmail.glesys.com>
In-Reply-To: <CAP9ODKpy9HsOfQF+Shy7HON7k34+RJ97d=azmGt=hrvkhE50jw@mail.gmail.com>
References: <1425989994-22071-1-git-send-email-magnus@minimum.se>
	<CAP9ODKpy9HsOfQF+Shy7HON7k34+RJ97d=azmGt=hrvkhE50jw@mail.gmail.com>
Date: Tue, 10 Mar 2015 15:54:56 +0100
From: magnus@minimum.se
To: openembedded-devel@lists.openembedded.org
User-Agent: SquirrelMail/1.4.21
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Subject: Re: [meta-java][PATCH] initials: silence "populate_sysroot manifest not found" warnings
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
X-List-Received-Date: Tue, 10 Mar 2015 14:45:19 -0000
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: 8bit

> On Tue, Mar 10, 2015 at 9:19 AM, Magnus Olsson <magnus@minimum.se> wrote:
>> A number of recipes in meta-java use autotools.bbclass for building;
>> internally
>> it uses the sstate-control populate_sysroot manifests to locate and copy
>> aslocals for configure dependencies as part of the do_configure step.
>> The manifest path differs depending on if it's a native package or not
>> so
>> autotools.bbclass looks at the package name to determine if its native
>> or not
>> (it's native if it ends with "-native").
>>
>> The warnings are emitted because a few (native) recipes in meta-java
>> (such as
>> cacao-initial, classpath-initial and more) are incorrectly being
>> classified as
>> non-native by autotools.bbclass, which makes it look for the manifest in
>> the
>> wrong place and finally gives up with the warning:
>>
>> WARNING:
>> /home/oe/tmp-glibc/sstate-control/manifest-mymachine-libecj-bootstrap.populate_sysroot
>> not found
>>
>> This happens for cacao-initial, classpath-initial, ecj-initial,
>> libecj-boostrap,
>> jamvm-initial and jikes-initial since they are all native and rely on
>> autotools.
>>
>> This patch renames the recipes so they end with -native, e.g
>> ecj-initial-native.
>> It also updates the recipes so they DEPEND on the corresponding new
>> name. This
>> helps autotools.bbclass to properly classify the recipes are native and
>> silence
>> the warnings.
>>
>> Signed-off-by: Magnus Olsson <magnus@minimum.se>
>
> What about the target packages? instead a class extend could be used.

autotools.bbclass will assume it's a target package if the name doesn't
end with -native or starts with -nativesdk (kind of a catch-all), so
target packages should be fine.

I think autotools.bbclass::autotools_copy_aclocals() can be patched to use
bb.data.inherits_class() to detect native and nativesdk packages (and so
will not need to look at the package name), but I still feel like this is
a good patch for meta-java since a -native prefix seem to be more or less
package name convention.

>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>



