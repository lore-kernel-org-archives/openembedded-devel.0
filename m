Received: from [213.4.149.66] (helo=ctsmtpout1.frontal.correo)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <manuel.teira@telefonica.net>) id 1HknBQ-0008N1-Dn
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 May 2007 22:18:16 +0200
Received: from [192.168.1.33] (83.35.20.15) by ctsmtpout1.frontal.correo
	(7.2.056.6) (authenticated as MANUEL.TEIRA$telefonica.net)
	id 463A7042000659B8 for openembedded-devel@lists.openembedded.org;
	Sun, 6 May 2007 22:17:54 +0200
From: Manuel Teira <manuel.teira@telefonica.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 06 May 2007 22:17:51 +0200
Message-Id: <1178482671.6132.10.camel@localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
Subject: gstreamer obsoleted recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 06 May 2007 20:18:16 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello all.

I've recently added some recipes for gstreamer and gst-plugins-[good|
bad|ugly|...] in order to build the last stable releases of this
software. I've seen that there are a lot of "old" stable releases that
if nobody is needing, we could sanely delete from the repository.

My plan is to only left the last stable version for all the related
packages, so, we would keep only the following recipes, in the directory
gstreamer:

gst-ffmpeg_0.10.2.bb
gst-plugins-base_0.10.12.bb
gst-plugins-good_0.10.5.bb
gst-plugins-ugly_0.10.5.bb
gstreamer_0.10.12.bb

The only distro that seems to depend on  a fixed gstreamer version
(0.10.11) is angstrom. But I assume that we can upgrade that requirement
to 0.10.12 without problems.

If nobody disagree, I will proceed with the gstreamer cleanup the next
week.

Best regards.




