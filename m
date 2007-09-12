Received: from [64.251.82.10] (helo=mail.tranzeo.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <DWatkins@tranzeo.com>) id 1IVVFC-0007Cb-Ui
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Sep 2007 18:39:15 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Wed, 12 Sep 2007 09:38:01 -0700
Message-ID: <D61182AC8012EA4EBC531B3AF23BE1093F1369@tranzeo-mail2.12stewart.tranzeo.com>
In-Reply-To: <3ef3a7ad0709120406r6aa761e7s610cd291880599db@mail.gmail.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] USE flags - why they won't work for OE
Thread-Index: Acf1Ls3NbH5XMp5YRi2cm8qow8L1iwAJi1Yg
References: <c384c5ea0709111614m20b079f8l4939336884b844b6@mail.gmail.com><HOECLKEKOHLAMMGDLLBHAENPMDAA.skoroneos@digital-opsis.com>
	<3ef3a7ad0709120406r6aa761e7s610cd291880599db@mail.gmail.com>
From: "Darcy Watkins" <DWatkins@tranzeo.com>
To: <openembedded-devel@lists.openembedded.org>
Cc: openembedded-devel@openembedded.org
Subject: Re: USE flags - why they won't work for OE
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
X-List-Received-Date: Wed, 12 Sep 2007 16:39:15 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

My two bits worth (Canadian - now almost at par with US currency.  ;-)

In the buildroot project, they use:

  $ make menuconfig

... to configure the system to be built and to select packages.  Then it
is all built up using auto configure type tools.  In fact, they even
have targets at the buildroot Makefile level that allow running the
menuconfig target for uclibc and busybox.

Perhaps an OE distro could provide the default answers to a similar
scheme, but the user should be able to run the menu config to change the
choices.  It would also be cool if the "lite" and other options could be
default rule filters to apply to a distro to change the default choices
before invoking the menu config.

After this, the build process should still check for dependencies and
include those needed but which were not chosen.  This has the added
benefit that if you remake down the road after removing packages, any
dependencies no longer needed would no longer be included.

It would be nice to run something like:

  <utilname>  DISTRO=3Dangstrom.2007.1 MACHINE=3Dmyppcbox \
    DEFAULTS=3Duclibc-lite,busybox-lite,packages-lite,secure-web-lite

...etc.  The filters could be run in some agreed order (e.g. left to
right) so it will be well understood how conflicts between filter files
will be resolved.

It would generate some .bb files to be included.  Then away to the
races...

An alternative would be to list the filters in the local config file and
just have bitbake invoke the menuconfig program when it detects a change
made to the list of filters.  For those who hate having the build
process launch an interactive application, have an
abort-on-config-change provision with output instructing the user to
manually run a menuconfig program.

I understand that there is value to consumer handheld devices to have a
package manager to run on the target to install and upgrade
applications, but that isn't of much use to smaller embedded appliances
where it is more important that the vendor strictly control the software
configurations that their support team will handle.  In such cases,
software upgradeability is typically managed more at the level of
filesystem images than as individual files and it is rare that the end
user is able to change anything other than user settings and preferences
stored in some form of a database.


Regards,

Darcy



