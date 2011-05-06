Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1QITfn-0001ux-Tv
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 May 2011 00:39:00 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 6E7DF166030B; Fri,  6 May 2011 16:36:19 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2-r929478 (2010-03-31) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2-r929478
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id E4F6A1660305;
	Fri,  6 May 2011 16:36:15 -0600 (MDT)
Message-ID: <4DC477DF.8070702@mlbassoc.com>
Date: Fri, 06 May 2011 16:36:15 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc13
	Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1304719828-22697-1-git-send-email-raj.khem@gmail.com>
	<1304720740.3928.26.camel@mattotaupa>
In-Reply-To: <1304720740.3928.26.camel@mattotaupa>
Cc: Paul Menzel <paulepanter@users.sourceforge.net>
Subject: Re: [meta-oe][PATCH] conf/layer.conf: conf/layer.conf: Document the operation on BBPATH correctly in the comment
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
X-List-Received-Date: Fri, 06 May 2011 22:39:00 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 05/06/2011 04:25 PM, Paul Menzel wrote:
> Am Freitag, den 06.05.2011, 15:10 -0700 schrieb raj.khem@gmail.com:
>> From: Khem Raj<raj.khem@gmail.com>
>>
>> Provide additional commentary that should help a bit more
>>
>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>> ---
>>   meta-efl/conf/layer.conf   |    2 +-
>>   meta-gnome/conf/layer.conf |    2 +-
>>   meta-gpe/conf/layer.conf   |    2 +-
>>   meta-oe/conf/layer.conf    |   18 +++++++++++++++++-
>>   4 files changed, 20 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta-efl/conf/layer.conf b/meta-efl/conf/layer.conf
>> index f019337..272fc04 100644
>> --- a/meta-efl/conf/layer.conf
>> +++ b/meta-efl/conf/layer.conf
>> @@ -1,4 +1,4 @@
>> -# We have a conf and classes directory, prepend to BBPATH to prefer o=
ur versions
>> +# We have a conf and classes directory, append to BBPATH
>>   BBPATH .=3D ":${LAYERDIR}"
>>
>>   # We have a recipes directory, add to BBFILES
>> diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf
>> index 6e8ff28..902ab8f 100644
>> --- a/meta-gnome/conf/layer.conf
>> +++ b/meta-gnome/conf/layer.conf
>> @@ -1,4 +1,4 @@
>> -# We have a conf and classes directory, prepend to BBPATH to prefer o=
ur versions
>> +# We have a conf and classes directory, append to BBPATH
>>   BBPATH .=3D ":${LAYERDIR}"
>>
>>   # We have a recipes directory, add to BBFILES
>> diff --git a/meta-gpe/conf/layer.conf b/meta-gpe/conf/layer.conf
>> index 006b6af..6c018b1 100644
>> --- a/meta-gpe/conf/layer.conf
>> +++ b/meta-gpe/conf/layer.conf
>> @@ -1,4 +1,4 @@
>> -# We have a conf and classes directory, prepend to BBPATH to prefer o=
ur versions
>> +# We have a conf and classes directory, append to BBPATH
>>   BBPATH .=3D ":${LAYERDIR}"
>>
>>   # We have a recipes directory, add to BBFILES
>> diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
>> index 36137e9..d5c2a17 100644
>> --- a/meta-oe/conf/layer.conf
>> +++ b/meta-oe/conf/layer.conf
>> @@ -1,4 +1,14 @@
>> -# We have a conf and classes directory, prepend to BBPATH to prefer o=
ur versions
>> +# It really depends on order of the layers appearing in BBLAYERS
>> +# variable in toplevel bblayers.conf file, where bitbake will search
>> +# for .inc files and others where bitbake uses BBPATH since it will
>> +# search the directories from first to last as specfied in BBPATH
>
> spec*i*fied
>
>> +# Therefore if you want a given layer to be considered high priority
>> +# for the .inc and .conf etc. then consider it adding at the beginnin=
g
>
> =E2=80=A6 then consider adding it to the =E2=80=A6
>
>> +# of BBPATH. For bblayers bitbake will use BBFILES_PRIORITY to resolv=
e
>> +# the recipe contention so the order of directories in BBFILES does
>> +# not matter
>
> Full stop at the end?
>
>> +
>> +# We have a conf and classes directory, append to BBPATH
>>   BBPATH .=3D ":${LAYERDIR}"
>>
>>   # We have a recipes directory, add to BBFILES
>> @@ -6,4 +16,10 @@ BBFILES +=3D "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDI=
R}/recipes-*/*/*.bbappend"
>>
>>   BBFILE_COLLECTIONS +=3D "openembedded-layer"
>>   BBFILE_PATTERN_openembedded-layer :=3D "^${LAYERDIR}/"
>> +
>> +# Define the priority for recipes (.bb files) from this layer
>
> Add an extra line to make paragraph more clear or start with a capital
> letter below?
>
>> +# this should be noted when you use this layer since it has
>
> Note sounds strange. Use =C2=BBdefined=C2=AB again?
>
>> +# to fall into the correct layer priority order that you have decided
>> +# for you layering model
>
> s/you/your/
>
>> +
>>   BBFILE_PRIORITY_openembedded-layer =3D "6"
>
> Acked-by: Paul Menzel<paulepanter@users.sourceforge.net>
>
> But please wait a bit before pushing it. Maybe a native speaker will
> read through the new comments.

The corrections look fine, but I think that last bit should be
worded more like this:

   # Define the priority for recipes (.bb files) from this layer,
   # choosing carefully how this layer interacts with all of the
   # other layers.

n.b. I'm not convinced of the worth of layer priorities; I don't
see what they gain and to me they only cause confusion...

--=20
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


