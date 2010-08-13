Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1Ojo9D-0004rY-FG
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Aug 2010 08:53:49 +0200
Received: from nat-dem.mentorg.com ([139.181.124.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1Ojo8z-0004L2-5u from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Aug 2010 23:53:33 -0700
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Fri, 13 Aug 2010 08:53:31 +0200
Message-ID: <989A078976CDAD4CB2DC976EEF70E2A504270E8A@eu2-mail.mgc.mentorg.com>
In-Reply-To: <AANLkTi=XHdsksjrnq3eB7_RM+p=qnL49zhPtFRKf2s4z@mail.gmail.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] [PATCH]Removing Legacy staging from genboot native recipe
Thread-Index: Acs6sZPSSoNmpRvdSXiGHnvwFropCAAAdZEg
References: <1281677993-19478-1-git-send-email-noor_ahsan@mentor.com>
	<AANLkTi=XHdsksjrnq3eB7_RM+p=qnL49zhPtFRKf2s4z@mail.gmail.com>
From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Noor_Ahsan@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH]Removing Legacy staging from genboot native recipe
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
X-List-Received-Date: Fri, 13 Aug 2010 06:53:49 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: openembedded-devel-bounces@lists.openembedded.org > > > > > > > > =
> > >[mailto:openembedded-devel-bounces@lists.openembedded.org] On =
Behalf Of >Frans Meulenbroeks
>Sent: Friday, August 13, 2010 11:30 AM
>To: openembedded-devel@lists.openembedded.org
>Subject: Re: [oe] [PATCH]Removing Legacy staging from genboot native =
recipe
>
>2010/8/13  <noor_ahsan@mentor.com>:
>> genboot: Removing legacy staging
>>
>> * Replaced do_stage function with do_install and replaced =
>${STAGING_BINDIR} with ${D}${bindir}
>> Signed-off-by: Noor Ahsan <noor_ahsan@mentorg.com>
>> diff --git a/recipes/simpad-utilities/genboot-native.bb =
b/recipes/simpad->utilities/genboot-native.bb
>> index 47b9b34..966a450 100644
>> --- a/recipes/simpad-utilities/genboot-native.bb>
>> +++ b/recipes/simpad-utilities/genboot-native.bb
>> @@ -9,12 +9,15 @@ DEPENDS =3D "pad-native"
>>
>> =A0inherit native
>>
>> +NATIVE_INSTALL_WORKS =3D "1"
>> +
>> =A0do_compile() {
>> =A0 =A0 =A0 =A0cp ${WORKDIR}/*.h ${WORKDIR}/*.c .
>> =A0 =A0 =A0 =A0${CC} -I. -o genboot gen_boot.c
>> =A0}
>>
>> -do_stage() {
>> - =A0 =A0 =A0 install -m 0755 genboot ${STAGING_BINDIR}/
>> - =A0 =A0 =A0 install -m 0755 ${WORKDIR}/simpad-make-flashimg =
>${STAGING_BINDIR}/
>> +do_install() {
>> + =A0 =A0 =A0 install -d ${D}${bindir}/
>> + =A0 =A0 =A0 install -m 0755 genboot ${D}${bindir}/
>> + =A0 =A0 =A0 install -m 0755 ${WORKDIR}/simpad-make-flashimg =
${D}${bindir}/
>> =A0}
>>

>You might also want to bumnp PR (although logically nothing changed so
>this is perhaps not needed)
>Can you also have a look at serload-native?
>And maybe trun it to contrib/oe-stylize.py

I also have patch for serload-native. Thanks for letting me know =
oe_stylize.py, I'll use it for sending the patch.


Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


