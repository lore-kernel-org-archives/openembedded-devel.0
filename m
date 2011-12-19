Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Rcfev-0004QX-JR
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Dec 2011 17:01:49 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pBJFsjcm018622
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Dec 2011 07:54:45 -0800 (PST)
Received: from Macintosh-5.local (172.25.36.232) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 19 Dec 2011 07:54:45 -0800
Message-ID: <4EEF5E44.5030903@windriver.com>
Date: Mon, 19 Dec 2011 09:54:44 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <20111219093447.C6DBE10331@opal>
	<201112191054.57179.schnitzeltony@gmx.de>
In-Reply-To: <201112191054.57179.schnitzeltony@gmx.de>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	pBJFsjcm018622
Subject: Re: [oe-commits] Scott Garman : Add missing SUMMARY fields to various recipes
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
X-List-Received-Date: Mon, 19 Dec 2011 16:01:50 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 12/19/11 3:54 AM, Andreas M=FCller wrote:
>> diff --git a/meta/recipes-support/libevent/libevent_1.4.14b.bb
>> b/meta/recipes-support/libevent/libevent_1.4.14b.bb index 1a369b5..364=
68dc
>> 100644
>> --- a/meta/recipes-support/libevent/libevent_1.4.14b.bb
>> +++ b/meta/recipes-support/libevent/libevent_1.4.14b.bb
>> @@ -1,4 +1,5 @@
>> -DESCRIPTION =3D "an asynchronous event notification library"
>> +SUMMARY =3D "An asynchronous event notification library"
>> +DESCRIPTION =3D "An asynchronous event notification library"
>>   HOMEPAGE =3D "http://www.monkey.org/~provos/libevent/"
>>   SECTION =3D "libs"
>>
> What is the value in creating redundancies by copying DESRCIPTION to SU=
MMARY?

(related item, not the actual answer to your existion)

For those unfamiliar with the SUMMARY, it automatically inherits the=20
DESCRIPTION.  In the original design of the SUMMARY field it was expected=
 that a=20
number of items already have "small" descriptions, so automatically inher=
iting=20
made sense.

When I did the original pass for oe-core to add summaries, what I found i=
s that=20
many of the "DESCRIPTIONS" are really just summaries.  So (in the example=
=20
above), I would have renamed the DESCRIPTION to summary, and put in a new=
, more=20
detailed DESCRIPTION.

For instance (taking from Fedora):

DESCRIPTION =3D "The libevent API provides a mechanism to execute \
a callback function when a specific event occurs on a file \
descriptor or after a timeout has been reached. libevent is \
meant to replace the asynchronous event loop found in event \
driven network servers. An application just needs to call \
event_dispatch() and can then add or remove events dynamically \
without having to change the event loop."

So my suggestion is when the DESCRIPTION is small enough, there is no rea=
son to=20
add a duplicate SUMMARY.  However, it should be a trigger that the DESCRI=
PTION=20
itself is likely just a summary, and a more explicit DESCRIPTION should b=
e=20
added.  (I always thing of a summary as "what is this in 74 charachters o=
r=20
less", and the DESCRIPTION is "why would I want this thing?")

--Mark

> Andreas
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



