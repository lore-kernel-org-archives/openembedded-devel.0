Return-Path: <Joshua.Vanderpool@raymondcorp.com>
Received: from smtp.raymondcorp.com (smtp.raymondcorp.com [24.97.209.121])
	by mail.openembedded.org (Postfix) with ESMTP id 7F0156B186
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2014 18:57:24 +0000 (UTC)
Received: from usnygrcas1.raymondcorp.local (nothing.attdns.com
	[130.1.155.194] (may be forged))
	by smtp.raymondcorp.com (8.14.3/8.14.3) with ESMTP id s0FIvO3F027653
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2014 12:57:25 -0600
Received: from USNYGRMBX4.raymondcorp.local ([169.254.4.152]) by usnygrcas1
	([130.1.155.198]) with mapi id 14.03.0158.001; Wed, 15 Jan 2014 13:57:25
	-0500
From: Vanderpool Josh <Joshua.Vanderpool@raymondcorp.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: image fails to fetch php
Thread-Index: Ac8SIuUhwMYB+YqmSBWmURdxcf6zYwAAJung
Date: Wed, 15 Jan 2014 18:57:24 +0000
Message-ID: <7D1F292BE8E4CC4F93079C1A7A58D5622BA33FA9@USNYGRMBX4.raymondcorp.local>
References: <7D1F292BE8E4CC4F93079C1A7A58D5622BA33F8D@USNYGRMBX4.raymondcorp.local>
In-Reply-To: <7D1F292BE8E4CC4F93079C1A7A58D5622BA33F8D@USNYGRMBX4.raymondcorp.local>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [130.1.155.15]
MIME-Version: 1.0
X-MessageScreenMessageID: 1389812245.253165.1642.968966155
X-MessageScreenContentScore: Score of 0 assigned to Content
X-MessageScreenUCEScore: Score of 0 assigned to UCE
X-MessageScreen: Analyzed by IntelliReach MessageScreen(tm)
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: FW: image fails to fetch php
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Jan 2014 18:57:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On 01/15/2014 11:54 AM, Maupin, Chase wrote:
From: meta-arago-bounces@arago-project.org<mailto:meta-arago-bounces@arag=
o-project.org> [mailto:meta-arago-bounces@arago-project.org] On Behalf Of=
 Vanderpool Josh
Sent: Wednesday, January 15, 2014 10:20 AM
To: meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>
Subject: [meta-arago] Building the tisdk image fails to fetch php

This is in the meta-openembeded layer but might be fixed in the master...=

I use the git://arago-project.org/git/projects/oe-layersetup.git to get r=
elease configs.

Anyway the SRC_URI is invalid for php-5.5.14 as they move them

[CEM] Do you mean 5.4.14?
/JDV yes 5.4.14



from: http://www.php.net/distributions/php-${PV}.tar.bz2
to: http://museum.php.net/php5/php-${PV}.tar.bz2

I just changed the php.inc at /tisdk/sources/meta-openembedded/meta-oe/re=
cipes-devtools/php/php.inc

I am just learning about layers i assume there is something i could have =
done in my local.conf but have not discovered yet...

Just wanted it to be noted in case others run into the issue.

[CEM] Josh, you may want to submit this patch to meta-openembedded@openem=
bedded.org<mailto:meta-openembedded@openembedded.org>.  I don't see that =
the master, dora, or dylan branches have been updated.  I didn't notice a=
nything on the list for this already
/JDV ok maybe the http://museum.php.net/php5<http://museum.php.net/php5/p=
hp-$> should be added as a mirror??
[CEM] I might just update the .inc





-Josh
Confidentiality Notice: The preceding e-mail message (including any attac=
hments) contains information that may be confidential, protected by appli=
cable legal privileges, or constitute non-public information. It is inten=
ded to be conveyed only to the designated recipient(s). If you are not an=
 intended recipient of this message, please notify the sender by replying=
 to this message and then delete it from your system. Use, dissemination,=
 distribution or reproduction of this message by unintended recipients is=
 not authorized and may be unlawful.


Confidentiality Notice:

The preceding e-mail message (including any attachments) contains informa=
tion that may be confidential, protected by applicable legal privileges, =
or constitute non-public information. It is intended to be conveyed only =
to the designated recipient(s). If you are not an intended recipient of t=
his message, please notify the sender by replying to this message and the=
n delete it from your system. Use, dissemination, distribution or reprodu=
ction of this message by unintended recipients is=20
not authorized and may be unlawful.



