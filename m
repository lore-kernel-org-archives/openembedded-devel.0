Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1QwdLG-0000zp-Rn
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Aug 2011 19:03:47 +0200
Received: (qmail 29791 invoked by uid 1003); 25 Aug 2011 16:58:49 -0000
Received: from unknown (HELO ?192.168.1.148?) (philip@opensdr.com@157.22.28.13)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	25 Aug 2011 16:58:49 -0000
Message-ID: <4E567F50.7080407@balister.org>
Date: Thu, 25 Aug 2011 09:58:56 -0700
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.18) Gecko/20110621 Fedora/3.1.11-1.fc14 Thunderbird/3.1.11
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4E554AD9.90607@balister.org>	<20110824194923.GC4258@rhein.zuhause.netz>	<4E55A72B.7070008@balister.org>
	<1314263137.4186.4.camel@mattotaupa>
In-Reply-To: <1314263137.4186.4.camel@mattotaupa>
Subject: Re: Build failure for openjade in dev: `libtool: link: cannot find the library `=/usr/lib/libstdc++.la'`
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
X-List-Received-Date: Thu, 25 Aug 2011 17:03:47 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/25/2011 02:05 AM, Paul Menzel wrote:
> Am Mittwoch, den 24.08.2011, 18:36 -0700 schrieb Philip Balister:
>> On 08/24/2011 12:49 PM, Henning Heinold wrote:
>>> On Wed, Aug 24, 2011 at 12:02:49PM -0700, Philip Balister wrote:
>>>> I am seeing this building openjade. As near as I can see, there
>>>> haven't been any changes to cause this. It does build in
>>>> release-2011.3-maintenance.
>>>>
>>>> Anyone have any clues?
>>>>
>>>> Philip
>>>> | + install-catalog --add /home/balister/oe/tmp/sysroots/x86_64-linux/etc/sgml/openjade-1.3.2.cat /home/balister/oe/tmp/sysroots/x86_64-linux/usr/share/sgml/openjade-1.3.2/catalog
>>>> | install-catalog: unable to write in /etc/sgml.
>>>
>>> hm maybee you need to traint install-catalog not to write at /etc/sgml
>>
>> It's beginning to look like bitbake master does not work with dev. Back
>> on 1.12.0 bitbake and things seem sane again.
>
> Well, it still fails for me. What build configuration do you use? I
> tested `angstrom-2010.x`, `minimal{,-uclibc}` for `MACHINE =
> "beagleboard"`. (Please always add that to the commit message.)
>
>          mkdir .libs
>          libtool: link: warning: library `/oe/build-minimal-eglibc/minimal-dev/sysroots/armv7a-oe-linux-gnueabi/usr/lib/libosp.la' was moved.
>          libtool: link: warning: library `/oe/build-minimal-eglibc/minimal-dev/sysroots/armv7a-oe-linux-gnueabi/usr/lib/libosp.la' was moved.
>          libtool: link: cannot find the library `=/usr/lib/libstdc++.la'
>          make[2]: *** [openjade] Error 1

I am building Angstrom 2010 for the usrp-e1xx (in overlay, but it should 
be very close to the overo).

Philip


>
>
>
> Thanks,
>
> Paul
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


