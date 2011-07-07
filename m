Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jkridner@beagleboard.org>) id 1QeqJ4-0000g6-OF
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jul 2011 17:15:58 +0200
Received: by bwf20 with SMTP id 20so1101872bwf.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jul 2011 08:12:07 -0700 (PDT)
Received: by 10.204.79.67 with SMTP id o3mr843651bkk.19.1310051527190;
	Thu, 07 Jul 2011 08:12:07 -0700 (PDT)
Received: from mail-bw0-f47.google.com (mail-bw0-f47.google.com
	[209.85.214.47])
	by mx.google.com with ESMTPS id e16sm7982527bke.18.2011.07.07.08.12.05
	(version=SSLv3 cipher=OTHER); Thu, 07 Jul 2011 08:12:06 -0700 (PDT)
Received: by bwf20 with SMTP id 20so1101832bwf.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jul 2011 08:12:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.204.84.36 with SMTP id h36mr853511bkl.76.1310051524774; Thu,
	07 Jul 2011 08:12:04 -0700 (PDT)
Received: by 10.204.102.139 with HTTP; Thu, 7 Jul 2011 08:12:04 -0700 (PDT)
In-Reply-To: <CAD=GYpZojdN_nkugcA7PNMNah32aYwEevsZAk7deFpAsTyR3cw@mail.gmail.com>
References: <1309968919-23810-1-git-send-email-agnel.joel@gmail.com>
	<CA+T6QPmwg7mbU-+YRM1=DuXUUJqJR+zqkyz=wcRFQAxff4mmYA@mail.gmail.com>
	<CAD=GYpZojdN_nkugcA7PNMNah32aYwEevsZAk7deFpAsTyR3cw@mail.gmail.com>
Date: Thu, 7 Jul 2011 11:12:04 -0400
Message-ID: <CA+T6QPngdwAUiJuhi=c2gq03G+aW0+tzExUQgvx322t+RRTC7w@mail.gmail.com>
From: Jason Kridner <jkridner@beagleboard.org>
To: Joel A Fernandes <agnel.joel@gmail.com>
Cc: jdk@ti.com, joelagnel@ti.com, beagleboard@googlegroups.com,
	openembedded-devel@lists.openembedded.org, k-kooi@ti.com
Subject: Re: [PATCH v2] beagleboard-test-scripts: Add a script flash-fs.sh for flashing NAND
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
X-List-Received-Date: Thu, 07 Jul 2011 15:15:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 7, 2011 at 10:49 AM, Joel A Fernandes <agnel.joel@gmail.com> wr=
ote:
> On Thu, Jul 7, 2011 at 9:35 AM, Jason Kridner <jkridner@beagleboard.org> =
wrote:
>> On Wed, Jul 6, 2011 at 12:15 PM, Joel A Fernandes <agnel.joel@gmail.com>=
 wrote:
>>> This script flashes the NAND of a BeagleBoard if it exists, and if ther=
e is a valid image to flash
>>>
>>> Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>
>>
>> Acked-by: Jason Kridner <jkridner@beagleboard.org>
>>
>> I will eventually merge your changes into the mainline, but I believe
>> it is helpful to get these updates in OE for BeagleBoard users who
>> want to reproduce the shipping images.
>>
>
>> Can you update the process to only flash the boards if the USER button
>> is held or some other similar strategy? =A0It seems that enabling this
>> script would make the SD card image useless for non-flashing
>
> Since we cannot access user-button as its used as an input event, can
> I put in a message like "Press any key to flash", timeout if no key is
> hit and then normally boot?

You should be able to check the status similar to the way you do for
keyboards.  From what I've read[1][2], you can simply use the
EVIOCGKEY ioctl to check the state.

[1] http://andrey.thedotcommune.com/2010/02/heres-another-quick-linux-input=
-snippet.html
[2] http://www.linuxjournal.com/node/6429/print

>
> Regards
> Joel
>


