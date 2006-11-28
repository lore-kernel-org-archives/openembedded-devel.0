Received: from [64.233.184.233] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <andrew.paulsen@gmail.com>) id 1GpAA0-00043v-3w
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Nov 2006 22:06:36 +0100
Received: by wr-out-0506.google.com with SMTP id i32so466794wra
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Nov 2006 13:06:22 -0800 (PST)
Received: by 10.78.204.1 with SMTP id b1mr1363833hug.1164747980896;
	Tue, 28 Nov 2006 13:06:20 -0800 (PST)
Received: by 10.78.159.2 with HTTP; Tue, 28 Nov 2006 13:06:20 -0800 (PST)
Message-ID: <d46153c40611281306u1022c0adjeb2e6304feeec399@mail.gmail.com>
Date: Tue, 28 Nov 2006 15:06:20 -0600
From: "Andrew Paulsen" <andrew.paulsen@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <d46153c40611280954w12514252o8897ac47f706266c@mail.gmail.com>
MIME-Version: 1.0
References: <d46153c40611220800m4e715362v713c24f5853238@mail.gmail.com>
	<d46153c40611221320l1226d03dtb2948a8f42a04cdd@mail.gmail.com>
	<f96d234e0611221324o352521ddj229fb267b995396b@mail.gmail.com>
	<d46153c40611221336h2fcb9ae3rabf5776b260a494d@mail.gmail.com>
	<f96d234e0611221452u6d2a8e01i6df017ce235624a4@mail.gmail.com>
	<d46153c40611280954w12514252o8897ac47f706266c@mail.gmail.com>
Subject: Re: Angstrom, compulab-pxa270, and gpe-image
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
X-List-Received-Date: Tue, 28 Nov 2006 21:06:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 11/28/06, Andrew Paulsen <andrew.paulsen@gmail.com> wrote:
> On 11/22/06, Cliff Brake <cliff.brake@gmail.com> wrote:
> > Try the generic distro.  I have not updated my tree in probably 2
> > weeks, but it may work.
>
> I just tried the "generic" distro and that fails to build in the same
> way that my original Familiar build failed:
>

I added the following two lines to my
/stuff/org.openembedded.dev/conf/distro/generic.conf file:
PREFERRED_VERSION_dbus ?= "1.0.1"
PREFERRED_VERSION_dbus-glib ?= "0.71"
and it got past the dbus compilation errors.  I don't see where the
previous versions (dbus 0.92 and incompatible dbus-glib 0.72) were
being set so I'm not sure what the procedure is to fix this correctly.


