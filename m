Received: from [64.233.166.182] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrew.paulsen@gmail.com>) id 1Jdu8H-0006qe-MZ
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Mar 2008 22:23:05 +0100
Received: by py-out-1112.google.com with SMTP id y77so2785204pyg.28
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Mar 2008 14:23:01 -0700 (PDT)
Received: by 10.65.180.9 with SMTP id h9mr14422004qbp.31.1206393780207;
	Mon, 24 Mar 2008 14:23:00 -0700 (PDT)
Received: by 10.65.249.15 with HTTP; Mon, 24 Mar 2008 14:23:00 -0700 (PDT)
Message-ID: <d46153c40803241423n4a6a7de3offb5ef8d0da4abca@mail.gmail.com>
Date: Mon, 24 Mar 2008 16:23:00 -0500
From: "Andrew Paulsen" <andrew.paulsen@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <d46153c40803200540h522b735cq483a8f510020fe09@mail.gmail.com>
MIME-Version: 1.0
References: <d46153c40803200540h522b735cq483a8f510020fe09@mail.gmail.com>
Subject: Re: [RFC] ipaq-sleep backlight control
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Mar 2008 21:23:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Mar 20, 2008 at 7:40 AM, Andrew Paulsen
<andrew.paulsen@gmail.com> wrote:
> I did a code cleanup on ipaq-sleep and added the option to use your
>  own backlight control script instead of gpe-conf to adjust brightness.
>
>  http://bugs.openembedded.org/show_bug.cgi?id=4101
>
>  I have since heard that all 2.6 devices use the standard
>  /sys/class/backlight/*/ method to control brightness and that we don't
>  need/want to support others.
>
>  So I have three options and I'd like some opinions:
>  1) Leave ipaq-sleep the way it is and ship a standard backlight
>  control script that can be overridden/changed per machine.  This still
>  allows the legacy gpe-conf method (the default right now)
>  2) Have ipaq-sleep write directly to /sys/class/backlight/*/ to tweak
>  the brightness and skip this whole mess
>  3) Have the option to select between 1&2 via conf file entry

I made a generic backlight control script that emulates the old
gpe-conf methods and enabled it by default.  It can easily be
overridden to the old behavior by changing ipaq-sleep.conf to point at
/usr/bin/bl instead of /usr/bin/bl-ctrl.  The code and recipe are in
the bugtracker.

>
>  Thanks!
>  Andrew
>


