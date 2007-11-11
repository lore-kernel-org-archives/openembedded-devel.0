Received: from [64.233.170.189] (helo=rn-out-0102.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <leon.woestenberg@gmail.com>) id 1IriHG-0001cm-Qg
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Nov 2007 00:01:11 +0100
Received: by rn-out-0102.google.com with SMTP id e24so684925rng
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Nov 2007 14:59:46 -0800 (PST)
Received: by 10.70.108.18 with SMTP id g18mr9251wxc.1194797779794;
	Sun, 11 Nov 2007 08:16:19 -0800 (PST)
Received: by 10.90.29.19 with HTTP; Sun, 11 Nov 2007 08:16:19 -0800 (PST)
Message-ID: <c384c5ea0711110816i3a182752qe28b92079adac86e@mail.gmail.com>
Date: Sun, 11 Nov 2007 17:16:19 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20071110191942.GA6734@lenovo>
MIME-Version: 1.0
References: <20071110191942.GA6734@lenovo>
Subject: Re: Using widgets to add structure to OpenEmbedded
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
X-List-Received-Date: Mon, 12 Nov 2007 23:01:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello David,

On Nov 10, 2007 8:19 PM, David Farning <dfarning@gmail.com> wrote:
>
> One of the most challenging aspects of describing OpenEmbedded is
> defining where a specific type of information is
> defined.  By not clearly specifying where information is defined, the
> SPOT (single point of truth) principle is violated.
>
Tthere are a lot of abstract objects in OpenEmbedded, some different
only by subtleties.

> There is always a trade-off between flexibility and introducing
> structure into a system.  In the case of BiteBake and
> OpenEmbedded, which solve a very specific problem, more is gained than
> lost by introducing structure.
>
The structure is there. It takes a steep learning curve to see what
the structure
is about.

> Graphical toolkits do a very good job of exchanging flexibility for
> structure by using widgets.  Everything is gtk+ is
> a widget.  Widgets have generic properties and methods which can
> easily be overridden.  Widgets can contain other widgets.
>
Objects.

Do not introduce widgets into BB/OE, you are throwing in a whole new
jargon that adds confusion, not structure!

> Similarly, BitBake and OpenEmbedded can be broken down into a number
> of widgets.  Each widget type represents a layer which
> define domain specific parameters and methods. Below is a possible
> widget hierarchy
>
> 1. Host Machine.
>   a. Set up build structure.
>   b. Native compiler.
>
> 2. Target Machine.
>   a. Target architecture.
>   b. Cross compiler.
>   c. Target specific device drivers.
>
A cross-compiler belongs with a target machine? No, I don't buy that,
too confusing.

A cross-compiler compiles on a certain architecture, for a certain architecture.

> Does anyone see any obvious problem with such a system before I start
> testing it?
>
> This type of structure would make the documentation much easier.  It
> would also significantly reduce the OpenEmbedded learning curve.
>
Sorry, I disagree. It would add MPOC (multiple points of confusion).

What is needed is a unambiguous description of what we have now, with the sole
purpose the smoothen the learning curve.

Regards,
-- 
Leon


