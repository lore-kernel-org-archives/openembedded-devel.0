Received: from web86704.mail.ird.yahoo.com ([217.146.188.145])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <jefflynne@btopenworld.com>) id 1NH07W-000830-15
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 Dec 2009 20:16:45 +0100
Received: (qmail 75720 invoked by uid 60001); 5 Dec 2009 19:08:22 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=btopenworld.com;
	s=s1024; t=1260040101;
	bh=Afh6Bk9C6WqcNwFct4Ah/5wV3jpbT+dnlLMlu3Bo9NY=;
	h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:MIME-Version:Content-Type;
	b=nmAPoQ15BIlJ38Blky40QiwapGnHINcrTtjkCe94dPRIJwlMDqUWsnsunrk7YL/Kl3pTJsRLd9tExylPm0Kd7o6sI58oBxEb6Mf36/TNUosaQJeFR7CNwVRN37EHKNUKnizxE/Le0G8zP4RgeNbi4O6dKYcUjyeR9A0pG1Dkm30=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=s1024; d=btopenworld.com;
	h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:MIME-Version:Content-Type;
	b=BMQeXkvWPYFr8Fwu4wG9kemAJDSUBlW0nUw59q42mlOcdbFtVvEshBnOMgsdp3ZJQRky62Fe+HWPxkvgwsnEAaKCgJRnqaoA+3zu8PXZicq3rH5xlqVNb0Vz/Oe7c3iFGh+rcZxVZHlk4xHpQEZ6hCyaIV0YEvU2dZftcYv4lOQ=;
Message-ID: <941205.75716.qm@web86704.mail.ird.yahoo.com>
X-YMail-OSG: jGQLKPQVM1nSJW2ZT.eUSM5s9Ck4CaQDZhx9sKWAvqQ5yV_aBZbDE5hs82hrSrmRhRVgfKEbkOamlhsV6h3NY5X.TeoAuIPOYBmg7kGj1Ga.WWfer5IGgF8S4ZNBdc3v7C4PtC3oBou7w4zrH4DTTJ5ZAaMiumBPp22QsrvmzcW0YehsE2Mnl9spIlt8LW6v_zOdkqZwtcYA_eCedBVGXRZ6YEW6KL.7k21sgDPCFL1qlDDJowThAnePRifFjRuNm8WqVc21D.PrIx2G0J_KTCkzDKWRz_Mp7aIG8QkugSaIVDtuNhksmLQRwAvxcSh7qX2n
Received: from [92.41.226.165] by web86704.mail.ird.yahoo.com via HTTP;
	Sat, 05 Dec 2009 19:08:21 GMT
X-Mailer: YahooMailClassic/8.1.6 YahooMailWebService/0.8.100.260964
Date: Sat, 5 Dec 2009 19:08:21 +0000 (GMT)
From: JEFF OWEN <jefflynne@btopenworld.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 217.146.188.145
X-SA-Exim-Mail-From: jefflynne@btopenworld.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Newbie: Dell Axim x51v
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
X-List-Received-Date: Sat, 05 Dec 2009 19:16:45 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

After some time and fiddling I have managed to get OE to build angstrom ima=
ges for x51v, however there are some issues.


I could not get the built Haret startup.txt to run, but by modifying the&#=
65533;
default.txt from the Android port found here:&#65533;
http://axdroid.blogspot.com/ I can get the&#65533; kernel to&#65533; load =
and both
the x11 and GPE images startup.


The problem I have is that the touch screen does not work so I can't get f=
urther.


The Android files seem to work OK and the touch screen works with that
OK, so in theory it can be sorted.&#65533; Can anyone give me some pointer=
s as
to where to look to sort this out?


Also, is anyone working on the Axim anymore? All the old links seem
dead - which is a shame as these units can be bought quite cheaply and
have plenty going for them.&#65533; I did read somewhere that the original
developers got fed up when Dell did not release any info.&#65533; It seems=
 to
me these old PDAs have been abandoned by their makers, so Linux is
their only salvation from the scrap heap.


To get the x51v to build I did have to copy the kernel options file
(default) from the x50 set.&#65533; How can I get these changes back into =
the
system? Is there a developer FAQ on how to submit changes?


Thanks in advance

Jeff


From denis@denix.org Sat Dec 05 21:19:34 2009
Received: from vms173001pub.verizon.net ([206.46.173.1]
	helo
