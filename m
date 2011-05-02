Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radoslav@kolev.info>) id 1QGr1x-0002Dk-Lp
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 May 2011 13:11:10 +0200
Received: by vxd7 with SMTP id 7so4725848vxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 May 2011 04:08:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.52.100.2 with SMTP id eu2mr7004120vdb.20.1304334512578; Mon,
	02 May 2011 04:08:32 -0700 (PDT)
Received: by 10.52.166.231 with HTTP; Mon, 2 May 2011 04:08:32 -0700 (PDT)
In-Reply-To: <4DBE8CAA.3050500@eukrea.com>
References: <BANLkTik1xhYidSX6QugYpYv5BmXCL78JUA@mail.gmail.com>
	<4DBE8CAA.3050500@eukrea.com>
Date: Mon, 2 May 2011 14:08:32 +0300
Message-ID: <BANLkTimWJswYwMu0a=6b_2tRAoW==MqkwQ@mail.gmail.com>
From: Radoslav Kolev <radoslav@kolev.info>
To: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: buildindex is always 0, using BB_GIT_CLONE_FOR_SRCREV = "1"
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
X-List-Received-Date: Mon, 02 May 2011 11:11:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, May 2, 2011 at 1:51 PM, Eric B=E9nard <eric@eukrea.com> wrote:
> Hi Radoslav,
>
> On 02/05/2011 12:18, Radoslav Kolev wrote:
>>
>> In the recipe I have
>>
>> SRCREV =3D "${AUTOREV}"
>> PV =3D "0.4+gitr-${SRCPV}"
>>
> replace SRCPV with SRVREV in PV and you will the the rev instead of O.

Thanks Eric! But I had tried this and the effect was the same. I
disabled BB_LOCALCOUNT_OVERRIDE =3D "" as Martin suggested, and it works
now!

Regards,
Rado


