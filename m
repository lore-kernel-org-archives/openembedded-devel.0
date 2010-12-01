Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sylvain.pare@gmail.com>) id 1PNnD2-0002GM-Ob
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Dec 2010 14:59:01 +0100
Received: by qwg5 with SMTP id 5so5701371qwg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Dec 2010 05:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=qf7/KxrMrj49vYhndY0OnZ56C0vmUvPR//A+h7pp32o=;
	b=j7L7tL1mbd41d3kNW1yRvPZ4CX1ZIRNBkpuAd0olT3EkcdPp1pEdiVIhl9e/RSugsX
	/CgtZnuFePK4t0K4GLBSsSmm7EwYE6tM9m51vD2pMm6/p0aTmzxrr1K0qz3pss2U/EEc
	Eis6snnw2enACZm4oH/c9qmmX00eWFeKi5Dpg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=MDe9BBDmMBraGg3QKR26uZ2EFCGD1cc8uEsesCV/FJcSPzkEGt1H9XLpn6/T0TzTyQ
	brreWY7ODtaIoCVtm46lx3avKPxj97Oy3UQCvGzTwdnopScAecKnqi2OxlzWE7tJonod
	qOiFq046Qf+DNTVjBv60Ylk252Dra7siHmdc4=
Received: by 10.229.246.79 with SMTP id lx15mr7340358qcb.30.1291211858384;
	Wed, 01 Dec 2010 05:57:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.229.185.81 with HTTP; Wed, 1 Dec 2010 05:57:18 -0800 (PST)
In-Reply-To: <AANLkTinp2NUm-WqGA+3n4sufPhMM0mB=dcH+Y-uMZ6Wf@mail.gmail.com>
References: <AANLkTimx+osQLb0Km1pXgQuPEwx3r1-ovhD9um_9p8GV@mail.gmail.com>
	<1291133947.3599.16.camel@mattotaupa>
	<AANLkTi=DUaiM6LhuWG6MVOntGBu7oikQm9QesD37zRj5@mail.gmail.com>
	<4CF56767.3050007@freyther.de>
	<AANLkTinp2NUm-WqGA+3n4sufPhMM0mB=dcH+Y-uMZ6Wf@mail.gmail.com>
From: =?ISO-8859-1?Q?Sylvain_Par=E9?= <sylvain.pare@gmail.com>
Date: Wed, 1 Dec 2010 14:57:18 +0100
Message-ID: <AANLkTi=G2iFhxVK8kg5+rwLq82vVku3UD-CAUOBKrPEw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: sylvain.pare@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: package request for Phonon-VLC backend
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
X-List-Received-Date: Wed, 01 Dec 2010 13:59:01 -0000
X-Groupsio-MsgNum: 26796
Content-Type: multipart/mixed; boundary=00163628482a2619b6049659b0ce

--00163628482a2619b6049659b0ce
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Ok I made some progress!
Automoc build now ( attached my recipe for it)
but qt4-plugin-phonon-backend-vlc failed =3D>
http://tinderbox.openembedded.org/packages/1159577/

I have attached my recipe too.
If someone can give me an hint.
thanks.
regards,

Sylvain (aka GarthPS)

2010/12/1 Sylvain Par=E9 <sylvain.pare@gmail.com>

> Hello Holger,
> I tried with qt4-tools-native but Phonon-VLC backend trally needs automoc=
4
> "Did not find automoc4"
>
> 2010/11/30 Holger Freyther <holger+oe@freyther.de<holger%2Boe@freyther.de=
>
> >
>
> On 11/30/2010 08:03 PM, Sylvain Par=E9 wrote:
>> > Thanks for your interest!
>> > here is my too recipes which are not soo valueable as it is mainly bum=
p
>> > version or so.
>> > here my automoc-native :
>> >
>>
>> sorry, I didn't completely follow the thread but qt4-tools-native instal=
ls
>> moc4, rcc4 and all the other tools to build Qt applications.
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
>

--00163628482a2619b6049659b0ce
Content-Type: application/octet-stream; name="automoc-native.bb"
Content-Disposition: attachment; filename="automoc-native.bb"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gh6a624y0

REVTQ1JJUFRJT04gPSAiYXV0b21vYyBpcyBhIG1lc3MgZm9yIHBlb3BsZSB3aG8gZG9uJ3Qgd2Fu
dCB0byBsZWFybiBhdXRvdG9vbHMiClBSSU9SSVRZID0gIm9wdGlvbmFsIgpMSUNFTlNFID0gIkdQ
TCIKREVQRU5EUyArPSAicXQ0LXgxMS1mcmVlIgoKU1JDUkVWID0gImI4NzNkMmNiNDU3NTAzMzIw
ZTVmMWQ1NmQ1MTZlMjNlZWI5YWQ3ZGIiCgpQViA9ICJnaXQke1NSQ1BWfSIKUFIgPSAicjAiCgpp
bmhlcml0IHF0NHgxMSBjbWFrZQoKU1JDX1VSSSA9ICJnaXQ6Ly9naXQua2RlLm9yZy9hdXRvbW9j
O3Byb3RvY29sPWdpdDticmFuY2g9bWFzdGVyIgpTID0gIiR7V09SS0RJUn0vZ2l0IgoKCiMgT0Ug
bGFja3Mgc29tZSBuYXRpdmUgcXQ0IHRvb2xzLCBzbyB3ZSB1c2UgdGhlIG9uZXMgZm9ybSB0aGUg
aG9zdCA6LwpFWFRSQV9PRUNNQUtFID0gIi1EUVRfTElCUkFSWV9ESVI9JHtPRV9RTUFLRV9MSUJE
SVJfUVR9IFwKCQkgLURRVF9JTlNUQUxMX0xJQlM9JHtPRV9RTUFLRV9MSUJESVJfUVR9IFwKCQkg
LURRVF9JTkNMVURFX0RJUj0ke09FX1FNQUtFX0lOQ0RJUl9RVH0gXAoJCSAtRFFUX0hFQURFUlNf
RElSPSR7T0VfUU1BS0VfSU5DRElSX1FUfSBcCgkJIC1EUVRfTU9DX0VYRUNVVEFCTEU9JHtPRV9R
TUFLRV9NT0N9IFwKCQkgLURRVF9VSUNfRVhFQ1VUQUJMRT0ke09FX1FNQUtFX1VJQ30gXAoJCSAt
RFFUX1VJQzNfRVhFQ1VUQUJMRT0ke09FX1FNQUtFX1VJQzN9IFwKCQkgLURRVF9SQ0NfRVhFQ1VU
QUJMRT0ke09FX1FNQUtFX1JDQ30gXAoJCSAtRFFUX1FNQUtFX0VYRUNVVEFCTEU9JHtPRV9RTUFL
RV9RTUFLRX0gXAoJCSAtRFFUX1FUQ09SRV9JTkNMVURFX0RJUj0ke09FX1FNQUtFX0lOQ0RJUl9R
VH0vUXRDb3JlIFwKCQkgLURRVF9EQlVTWE1MMkNQUF9FWEVDVVRBQkxFPS91c3IvYmluL3FkYnVz
eG1sMmNwcCBcCgkJIC1EUVRfREJVU0NQUDJYTUxfRVhFQ1VUQUJMRT0vdXNyL2Jpbi9xZGJ1c2Nw
cDJ4bWwgXAoJCSAtRFFUX01LU1BFQ1NfRElSPSR7UU1BS0VTUEVDfS8uLi8gXCAKIgoKCgpPRUNN
QUtFX0JVSUxEUEFUSCA9ICJidWlsZCIKCk9FQ01BS0VfU09VUkNFUEFUSCA9ICIuLi8i

--00163628482a2619b6049659b0ce
Content-Type: application/octet-stream; 
	name="qt4-plugin-phonon-backend-vlc.bb"
Content-Disposition: attachment; filename="qt4-plugin-phonon-backend-vlc.bb"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gh6a66ma1

REVTQ1JJUFRJT04gPSAicXQ0LXBsdWdpbi1waG9ub24tYmFja2VuZC12bGMiCkFVVEhPUiA9ICJG
YXRoaSBCb3VkcmEgPGZhYm9Aa2RlLm9yZz4gKGN1cnJlbnQgbWFpbnRhaW5lcikgTHVrYXMgRHVy
ZmluYSA8bHVrYXMuZHVyZmluYUBnbWFpbC5jb20+IFRhbmd1eSBLcm90b2ZmIDx0a3JvdG9mZkBn
bWFpbC5jb20+IgpTRUNUSU9OID0gImxpYnMiClBSSU9SSVRZID0gIm9wdGlvbmFsIgpIT01FUEFH
RSA9ICJodHRwOi8vcGhvbm9uLmtkZS5vcmcvIgpMSUNFTlNFID0gIkxHUEwiCgpERVBFTkRTICs9
ICJxdDQteDExLWZyZWUgdmxjIGF1dG9tb2MtbmF0aXZlIgoKU1JDUkVWID0gIjFkZjM5YzliZDMw
NmIwYjQ2MzU2ZDEzYjI0ZmNhNWY2MzJlMWIzMjciCgoKUFYgPSAiMC4zLjAiClBSID0gInIwIgpQ
Ul9hcHBlbmQgPSAiK2dpdCR7U1JDUkVWfSIKCmluaGVyaXQgcXQ0eDExIGNtYWtlCgpTUkNfVVJJ
ID0gImdpdDovL2dpdG9yaW91cy5vcmcvcGhvbm9uL3Bob25vbi12bGMuZ2l0O3Byb3RvY29sPWdp
dDticmFuY2g9bWFzdGVyICIKUyA9ICIke1dPUktESVJ9L2dpdCIKCkVYVFJBX09FQ01BS0UgPSAi
LURRVE9OTFk9T04gLURDTUFLRV9CVUlMRF9UWVBFPVJlbGVhc2UgXAotRFFUX0xJQlJBUllfRElS
PSR7T0VfUU1BS0VfTElCRElSX1FUfSBcCi1EUVRfSU5TVEFMTF9MSUJTPSR7T0VfUU1BS0VfTElC
RElSX1FUfSBcCi1EUVRfSU5DTFVERV9ESVI9JHtPRV9RTUFLRV9JTkNESVJfUVR9IFwKLURRVF9I
RUFERVJTX0RJUj0ke09FX1FNQUtFX0lOQ0RJUl9RVH0gXAotRFFUX01PQ19FWEVDVVRBQkxFPSR7
T0VfUU1BS0VfTU9DfSBcCi1EUVRfVUlDX0VYRUNVVEFCTEU9JHtPRV9RTUFLRV9VSUN9IFwKLURR
VF9VSUMzX0VYRUNVVEFCTEU9JHtPRV9RTUFLRV9VSUMzfSBcCi1EUVRfUkNDX0VYRUNVVEFCTEU9
JHtPRV9RTUFLRV9SQ0N9IFwKLURRVF9RTUFLRV9FWEVDVVRBQkxFPSR7T0VfUU1BS0VfUU1BS0V9
IFwKLURRVF9RVENPUkVfSU5DTFVERV9ESVI9JHtPRV9RTUFLRV9JTkNESVJfUVR9L1F0Q29yZSBc
Ci1EUVRfREJVU1hNTDJDUFBfRVhFQ1VUQUJMRT0vdXNyL2Jpbi9xZGJ1c3htbDJjcHAgXAotRFFU
X0RCVVNDUFAyWE1MX0VYRUNVVEFCTEU9L3Vzci9iaW4vcWRidXNjcHAyeG1sIFwKLURRVF9NS1NQ
RUNTX0RJUj0ke1FNQUtFU1BFQ30vLi4vIFwgCiIKCk9FQ01BS0VfQlVJTERQQVRIID0gImJ1aWxk
IgoKT0VDTUFLRV9TT1VSQ0VQQVRIID0gIi4uLyIKCiNkb19pbnN0YWxsKCkgewojfQo=

--00163628482a2619b6049659b0ce--
