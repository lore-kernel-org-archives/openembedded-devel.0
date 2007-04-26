Received: from [66.249.82.235] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <matthijs.van.de.water@gmail.com>) id 1Hh0qS-0006t4-CQ
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Apr 2007 12:05:01 +0200
Received: by wx-out-0506.google.com with SMTP id t14so505197wxc
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Apr 2007 02:56:11 -0700 (PDT)
Received: by 10.90.79.6 with SMTP id c6mr1765807agb.1177581371615;
	Thu, 26 Apr 2007 02:56:11 -0700 (PDT)
Received: by 10.90.119.17 with HTTP; Thu, 26 Apr 2007 02:56:11 -0700 (PDT)
Message-ID: <35a670560704260256k2029136fh760dd206e49770c6@mail.gmail.com>
Date: Thu, 26 Apr 2007 11:56:11 +0200
From: "Matthijs van de Water" <matthijs.van.de.water@gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
Subject: Automatically including mypackage-locale-* in root_fs
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
X-List-Received-Date: Thu, 26 Apr 2007 10:05:01 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

I'd like to know if there is a way to automatically include the
available translations for a selection of my packages.

I would see this as making my image.bb file RDEPEND on
mypackage-locale or similar and this automatically be expanded to a
number of mypackage-locale-${LANGUAGE} where ${LANGUAGE} generated
from IMAGE_LINGUAS.

If something like this does not exist, where and how would be the best
place for me to add this? Inside rootfs_ipk.bbclass?

I am working on kind of an old checkout of OE, so that might
complicate things a little, but I'd like to contribute this back to
mainstream when I get this working.

Thanks,
(Now finally able to post under my real name: it's time for my company
to move out of the shadows. More to follow, like an iLiad config for
OE.)

-- 
Matthijs van de Water      | iRex Technologies B.V.
Embedded Software Engineer | www.irextechnologies.com


