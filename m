Received: from smtp3.nedap.com ([87.249.123.12] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jaap.dejong@nedap.com>) id 1SC8on-0002az-0l
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Mar 2012 14:14:37 +0200
Received: from nvs0066.nedap.local (10.91.8.1) by relaysmtp1.nedap.local
	(10.1.8.139) with Microsoft SMTP Server id 8.3.83.0; Mon, 26 Mar 2012
	14:05:36 +0200
X-TM-IMSS-Message-ID: <51d7da3200158051@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.1) id 51d7da3200158051 ;
	Mon, 26 Mar 2012 14:05:42 +0200
Message-ID: <4F705B90.2000408@nedap.com>
Date: Mon, 26 Mar 2012 14:05:36 +0200
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.27) Gecko/20120216 Lightning/1.0b2 Thunderbird/3.1.19
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <4F6B28B0.6010801@nedap.com>	<4F703D96.6020102@nedap.com>
	<CAFZPMoYNvc4XFdSy9_xH-CYb8R1MOR8-7XsWU0medQFBnWTs8g@mail.gmail.com>
In-Reply-To: <CAFZPMoYNvc4XFdSy9_xH-CYb8R1MOR8-7XsWU0medQFBnWTs8g@mail.gmail.com>
Subject: Re: foreign repository
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
X-List-Received-Date: Mon, 26 Mar 2012 12:14:37 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Thanks!

It was never my intention to create new recipes for all the packages 
that are in this foreign repository.
I would have to update every 2 weeks or so to keep in sync with that 
repository.
Don't want that!

I only want to install the package that is in that repository and its 
dependencies.

This is what I did.
Added the foreign repository in: angstrom-feed-configs.bbappend
So with 'opkg update' it is read.
Created an empty 'placeholder' recipe for the package to include.
When I bitbake my image this empty package is included in the rootfs.
Now i only have to 'opkg update/upgrade' to get the actual packages in.
This is by far the easiest solution (I think...)

Thanks again!
Jaap


On 03/26/2012 12:31 PM, Sergey Lapin wrote:
> On Mon, Mar 26, 2012 at 1:57 PM, Jaap de Jong<jaap.dejong@nedap.com>  wrote:
>> Anyone?
>> Any idea?
> You can read OE wiki regarding overlays/layers.
> Also, you can use Koen's Angstrom scripts for no-brains configuration process.
> Also, bitbake manual and OE existing layers are your friends.
>
> S.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


