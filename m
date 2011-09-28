Received: from na3sys009aog112.obsmtp.com ([74.125.149.207])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <mdpoole@troilus.org>) id 1R8xIt-0001QW-DX
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Sep 2011 18:48:15 +0200
Received: from mail-yi0-f53.google.com ([209.85.218.53]) (using TLSv1) by
	na3sys009aob112.postini.com ([74.125.148.12]) with SMTP
	ID DSNKToNOiYti4Labva6LOgvb4e0Tuslw4fR9@postini.com;
	Wed, 28 Sep 2011 09:42:50 PDT
Received: by mail-yi0-f53.google.com with SMTP id 21so7696783yie.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Sep 2011 09:42:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.151.9 with SMTP id y9mr8373259and.56.1317224333635; Wed,
	28 Sep 2011 08:38:53 -0700 (PDT)
Received: by 10.100.172.17 with HTTP; Wed, 28 Sep 2011 08:38:53 -0700 (PDT)
In-Reply-To: <4E833873.9090805@mlbassoc.com>
References: <1316770597.99899.YahooMailNeo@web121512.mail.ne1.yahoo.com>
	<4E7C63C8.3050900@mlbassoc.com>
	<CAOU-OA+uKFYL4nJutdTHsUCYnGy9=NiYW65jGbRk76+GL6iocg@mail.gmail.com>
	<4E7DB4E4.5090202@mlbassoc.com>
	<CAOU-OA+9_Y4_3W9wy=YMNsW--wc49+i1xqsvxRuLc7jpRQ+efA@mail.gmail.com>
	<4E833873.9090805@mlbassoc.com>
Date: Wed, 28 Sep 2011 11:38:53 -0400
Message-ID: <CAOU-OALZe6wHmWPeAA8jqJUaPOKfyaqTqKuXxPCuwmeRxrBHDA@mail.gmail.com>
From: Michael Poole <mdpoole@troilus.org>
To: Gary Thomas <gary@mlbassoc.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: ti_cgt_c6000_6.1.17_setup_linux_x86.bin error while installing ti-codec-engine
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
X-List-Received-Date: Wed, 28 Sep 2011 16:48:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 28, 2011 at 11:08 AM, Gary Thomas wrote:
> On 2011-09-28 08:58, Michael Poole wrote:
>>
>> On Sat, Sep 24, 2011 at 6:45 AM, Gary Thomas wrote:
>>>
>>> On 2011-09-23 14:46, Michael Poole wrote:
>>>>
>>>> On Fri, Sep 23, 2011 at 6:47 AM, Gary Thomas wrote:
>>>>>
>>>>> Check to make sure that you don't have write permission to /opt
>>>>> If you have write permission in the directory /opt, the installer
>>>>> fails to put the tools where they belong in your OE build.
>>>>
>>>> Is it generally known that this limitation is due to a bug in
>>>> ti-eula-unpack.inc? =A0(Python's print automatically adds a newline,
>>>> which the code's author apparently did not expect.) =A0My local repo h=
as
>>>> these changes to allow in-tree installs by users with write access to
>>>> /opt; please pardon Gmail's mangling of leading whitespace:
>>>
>>> I don't know if this is a generally known fact; it should be, I reporte=
d
>>> it
>>> to
>>> this list more than a year ago and was basically ignored [actually told=
 I
>>> just
>>> shouldn't have write access to /opt so the issue was my own fault...]
>>>
>>> Does the unpack work with your patches if /opt is not writeable?
>>
>> Yes, it does. =A0(It took a few days for me to find time to do a clean
>> rebuild on a system where I didn't need write access to /opt.)
>
> Thanks for checking.
>
> Will you push these changes into meta-texasinstruments (please)?

Yes, I can check it against that and submit a patch.  I have been
using OE-classic to date, so it might take a bit for me to get that
build right.

Michael Poole


