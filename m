Received: from mail-dotnet1.eads.net ([80.156.45.103])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Wolfgang.Hauser.external@cassidian.com>)
	id 1Oyhv1-0001Wh-1s for openembedded-devel@lists.openembedded.org;
	Thu, 23 Sep 2010 11:16:44 +0200
Received: from unknown (HELO de-gate1.mailhub.intra.corp) ([53.154.243.33])
	by mail-dotnet1.eads.net with ESMTP; 23 Sep 2010 11:02:26 +0200
Received: from gateinet0.mail.ds.corp ([149.207.23.240]) by
	de-gate1.mailhub.intra.corp with Microsoft SMTPSVC(5.0.2195.6713); 
	Thu, 23 Sep 2010 11:16:18 +0200
Received: from deimsg40.de.net.world ([53.141.233.80]) by
	gateinet0.mail.ds.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Thu, 23 Sep 2010 11:16:19 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Thu, 23 Sep 2010 11:16:17 +0200
Message-ID: <0B51A1E7C61D114DAE6FC10B0FD0ABA501A74421@deimsg40.de.net.world>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: How to add special directories and files to a native package ? 
thread-index: ActZdZqsswsNS51rQ+O9Q5LyEAczzABiXT0A
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@cassidian.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 23 Sep 2010 09:16:19.0011 (UTC)
	FILETIME=[FB56A130:01CB5AFF]
X-SA-Exim-Connect-IP: 80.156.45.103
X-SA-Exim-Mail-From: Wolfgang.Hauser.external@cassidian.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: How to add special directories and files to a native package ?
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
X-List-Received-Date: Thu, 23 Sep 2010 09:16:45 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

I managed the providing of my none standard directories.

I use following statement to append the processing of the directories:

sysroot_stage_dirs_append() {
    sysroot_stage_dir $from/usr/local/xxx/yyy =
$to${STAGING_DIR_HOST}/usr/local/xxx/yyy
}

I haven't see that in a recipe yet.
Is that a proper way ? What are the possible impacts ?

Regards
Wolfgang Hauser

-----Urspr=FCngliche Nachricht-----
Von: Hauser, Wolfgang (external)=20
Gesendet: Dienstag, 21. September 2010 12:13
An: 'openembedded-devel@lists.openembedded.org'
Betreff: How to add special directories and files to a native package ?=20

Hello,

I have to place some files into a special path in a native package / =
staging.

I tried to add these directories by

FILES_${PN} =3D " \
  /usr/local/xxx/bin \
  /usr/local/xxx/lib \
  /usr/local/xxx/scripts \
"

in my xxx-native recipe, but this won't work for the native staging, the =
directories do not appear in the syssroots/i386-linux path where I =
expected they will go to. (same, if I use BBCLASSEXTEND)

Where I have to add my special directories and files to get it into the =
native staging path ?

Background, I can't install the application into the standard linux =
path, there are some conflicts,

Regards
Wolfgang Hauser


