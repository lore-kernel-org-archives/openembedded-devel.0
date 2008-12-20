Received: from [209.85.198.246] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hynek.petrak@gmail.com>) id 1LE8Wx-0003u8-3g
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Dec 2008 21:34:35 +0100
Received: by rv-out-0708.google.com with SMTP id f25so1650486rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Dec 2008 12:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type;
	bh=MPhkjpqlhoaZj2rDXDgH5kqajMj0vkOExnx1+CXZo9U=;
	b=h1rP4FbkJoUN36aC6ngssdckb5b0SzdAuI4lN5hEJrsYQ9zoRtcfvTX5BcwMTblOq6
	yoN65g1qDNg7l3gMeZq9Kp3EOmc5EY2JtfrNY0lt95vUviF1Cqq0Ui+hQo1UiOWj74UW
	5OH4vrHTfgWMQfPgh03vwQwQ4blxHxfnNRwpM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type;
	b=msE0WH+xt0+3hFQ0P/rSTuxsi+0iC9HBBYNJQcCptz/+x+lF4wAAU+kams/YEGFr+O
	iSMlxZ4ODstz8iaWqCJmwphv2YVQ02uNEeAj8HqUYcxSMenH6mOBhDysDwecRreNjReq
	zz3E0Lj+pXbWd8Dhv7uYwzCUpTx9jI2NYJUVE=
Received: by 10.140.171.18 with SMTP id t18mr2323805rve.10.1229804988896;
	Sat, 20 Dec 2008 12:29:48 -0800 (PST)
Received: by 10.141.142.19 with HTTP; Sat, 20 Dec 2008 12:29:48 -0800 (PST)
Message-ID: <7f393bf90812201229w3f62850ej82b93a1bff271934@mail.gmail.com>
Date: Sat, 20 Dec 2008 21:29:48 +0100
From: "Hynek Petrak" <hynek.petrak@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: PATCH: added smstools, owfs, temploggerd packages
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
X-List-Received-Date: Sat, 20 Dec 2008 20:34:35 -0000
X-Groupsio-MsgNum: 7055
Content-Type: multipart/mixed; 
	boundary="----=_Part_31321_7179433.1229804988888"

------=_Part_31321_7179433.1229804988888
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi guys,
while preparing a device for my home automation project based on Alix
(Geode) board, I've added few packages, you might find handy. Check out the
patch file.

-- 
Mgr. Hynek Petrak
PGP key: http://pgp.mit.edu:11371/pks/lookup?op=get&search=0x84CB94CF
PGP fingerprint: 5CAC 7712 CFFD D076 0D74 A134 1EFD 728C 84CB 94CF

------=_Part_31321_7179433.1229804988888
Content-Type: application/x-gzip;
 name=0001-added-smstools-owfs-temploggerd-packages.patch.gz
Content-Transfer-Encoding: base64
X-Attachment-Id: f_foyq3rej0
Content-Disposition: attachment;
 filename=0001-added-smstools-owfs-temploggerd-packages.patch.gz

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

------=_Part_31321_7179433.1229804988888--
