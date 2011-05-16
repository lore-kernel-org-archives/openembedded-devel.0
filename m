Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QLwPM-0003Td-RW
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 May 2011 13:56:20 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1QLvxT-0003xe-4z
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 May 2011 13:27:32 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4DD10E76.1060100@opendreambox.org>
References: <1303134465.3910.63.camel@mattotaupa>
	<1303134640.3910.67.camel@mattotaupa>	<4DAD7297.2030606@opendreambox.org>
	<1303506946.4155.81.camel@mattotaupa>
	<AF97BCF4-CD32-4069-BB81-FECAC104F6D9@dominion.thruhere.net>
	<1303509611.4155.111.camel@mattotaupa> <iou12i$88c$1@dough.gmane.org>
	<1305476698.5838.622.camel@mattotaupa>
	<4DD10E76.1060100@opendreambox.org>
Date: Mon, 16 May 2011 12:53:22 +0100
Message-ID: <1305546802.2429.8.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [RFC] [PATCH 2/2] pkgconfig: add git version
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
X-List-Received-Date: Mon, 16 May 2011 11:56:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-05-16 at 13:45 +0200, Andreas Oberritter wrote:
> I still think that using SRCPV in PR is just wrong. SRCPV doesn't change
> the version of the package but the version of the packaged content.
> Otherwise it would be called SRCPR.

Agreed.  If you want SRCPV anywhere (and it's not entirely obvious that
all distros would want it at all), it seems like it should go in either
PV, PKGV, the DESCRIPTION, or some custom output field.  Jamming it into
${PR} from the recipe does seem, as you say, "just wrong".

See also gitpkgv.bbclass which has some further words about this stuff.

p.




