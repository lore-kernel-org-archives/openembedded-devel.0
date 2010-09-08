Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1OtDdK-0006gB-Pi
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 07:55:51 +0200
Received: from nat-dem.mentorg.com ([139.181.124.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1OtDcd-0000DX-Ri from Noor_Ahsan@mentor.com ;
	Tue, 07 Sep 2010 22:55:04 -0700
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Wed, 8 Sep 2010 07:55:01 +0200
Message-ID: <989A078976CDAD4CB2DC976EEF70E2A5042F17C1@eu2-mail.mgc.mentorg.com>
In-Reply-To: <AANLkTi=_oLg6OsO5R3x4aQu0OGDeQGm_X8o640Cdc+uW@mail.gmail.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] llvm-native package dependency on binutils-croos package
Thread-Index: ActNrngR9dXfpIzVRf+3RUThAXo1xwBa6y8g
References: <989A078976CDAD4CB2DC976EEF70E2A5042F15B5@eu2-mail.mgc.mentorg.com>
	<AANLkTi=_oLg6OsO5R3x4aQu0OGDeQGm_X8o640Cdc+uW@mail.gmail.com>
From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Noor_Ahsan@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: robertschuster@fsfe.org
Subject: Re: llvm-native package dependency on binutils-croos package
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
X-List-Received-Date: Wed, 08 Sep 2010 05:55:51 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

I am going to remove binutils-cross dependency from llvm-native package
as this package does build successfully without binutils-cross
dependency.

Regards,
Noor

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org
[mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
Frans Meulenbroeks
Sent: Monday, September 06, 2010 3:29 PM
To: openembedded-devel@lists.openembedded.org
Cc: robertschuster@fsfe.org
Subject: Re: [oe] llvm-native package dependency on binutils-croos
package

2010/9/6 Ahsan, Noor <Noor_Ahsan@mentor.com>:
> Hi all,
>
>
>
> I was looking into llvm2.7-native package (llvm2.7-native_2.7.bb). Its
> recipe file includes llvm-native.inc, in this file the DEPENDS lists
> contains binutils-cross package. I am bit confused that why a
non-native
> package is present in DPENDS list of a native package. This commit
link
> is 6da4ed714f269373271a14149b131bf1ff7a6def.
>
>
>
> When I removed the binutils-cross from the dependency list and cleaned
> binutils-cross and llvm-native packages and rebuilt llvm-native
package
> it built without any problem. So if llvm-native build successfully
then
> I think binutils-cross should be removed from the DEPENDS list. Can
> somebody explain the reason if binutils-cross in the DEPENDS list?
> Thanks.
>
>
>
> Regards,
>
> Noor
>
>

Noor, thanks for spotting this.
To me this dependency seems very weird.
I can imagine a dependency on binutils-native, but having a host
recipe depend on a target recipe is somewhat strange.
Should this be a dep on binutils-native ?
Robert, can you elaborate (as you added the dep)?

Thanks alot, Frans

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


