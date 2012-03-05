Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1S4ZnR-0001GQ-Ja
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Mar 2012 16:25:57 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id DE51CF811F8; Mon,  5 Mar 2012 08:17:23 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 46FA0F811F6;
	Mon,  5 Mar 2012 08:17:22 -0700 (MST)
Message-ID: <4F54D902.90304@mlbassoc.com>
Date: Mon, 05 Mar 2012 08:17:22 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4F54C8C2.5020003@mlbassoc.com>
	<CALbNGRRNwFXh0Ppwr1JrUWp4TwsJXELVM74OxfpVY=X5NpVU2Q@mail.gmail.com>
	<4F54CEF0.70902@mlbassoc.com>
	<CALbNGRQk__t-U0VmHpQ=sXeoCXrjA7vbREFbBYjy-+v2F97a_Q@mail.gmail.com>
In-Reply-To: <CALbNGRQk__t-U0VmHpQ=sXeoCXrjA7vbREFbBYjy-+v2F97a_Q@mail.gmail.com>
Subject: Re: [meta-mozilla] Can't access any HTTPS page
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
X-List-Received-Date: Mon, 05 Mar 2012 15:25:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2012-03-05 08:04, Andreas M=FCller wrote:
> On Mon, Mar 5, 2012 at 3:34 PM, Gary Thomas<gary@mlbassoc.com>  wrote:
>> On 2012-03-05 07:18, Andreas M=FCller wrote:
>>>
>>> On Mon, Mar 5, 2012 at 3:08 PM, Gary Thomas<gary@mlbassoc.com>    wro=
te:
>>>>
>>>> I've added firefox to my platform by adding the meta-mozilla layer
>>>> (and it's requirements).  To include firefox, all I did was
>>>>   CORE_EXTRA_IMAGE_INSTALL +=3D "firefox"
>>>>
>>>> With this setup, firefox works, but not with any SSL page,
>>>> e.g. trying to access https://google.com/mail gives me this
>>>> error screen:
>>>>
>>>> Secure Connection Failed
>>>>            An error occurred during a connection to accounts.google.=
com.
>>>>        security library: memory allocation failure.
>>>>        (Error code: sec_error_no_memory)
>>>>
>>>>   The page you are trying to view can not be shown because the
>>>> authenticity
>>>> of the received data could not be verified.
>>>>   Please contact the website owners to inform them of this problem.
>>>> Alternatively, use the command found in the help menu to report this
>>>> broken
>>>> site.
>>>>
>>>> Did I miss something?  Has anyone else tried this?
>>>>
>>>> Thanks
>>>>
>>> Is the time of your system valid ( if I remember right I had similar
>>> when system time was unbuffered initial at 01.01.2000 )?
>>
>>
>> Yes, the time is set correctly.
>>
> AArgh - the system time caused trouble on cookies - other issue sorry.
>
> In midori it helped to install glib-networking ( see meta-oe commit
> a56bff13b9d22b608352501fbb3ef124e7147bda ). Maybe this helps for
> firefox too?

Sorry, no change.

--=20
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


