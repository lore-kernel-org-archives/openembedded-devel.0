Received: from [72.14.220.157] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1L96zq-0001mU-La
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Dec 2008 00:55:38 +0100
Received: by fg-out-1718.google.com with SMTP id l26so421428fgb.20
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Dec 2008 15:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type:content-transfer-encoding
	:content-disposition;
	bh=RZU6kgiLnNXk623fosckiMsnhpCZwcfeg5hCaUwFQpM=;
	b=Ibrs2Js1mVF/aEQTkkU0AgogHWml5nDokjOfMuQQC9sJCFdQSaU6CoUlo0HW9Ig/y2
	KPpxAUhg0m8D3e8b52eRf5oPw4azYiTHFhwfMFyWGrrrymsgfNctb4LcyTtg6J38KTAM
	mVpUFWbuDof7otx4KWoFFfFB4w95IDh7/wAuE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type
	:content-transfer-encoding:content-disposition;
	b=m6Vg36BscB28h/UGLjuSf3aWm1lHrC9JNfkRUfSBwUY8WsclLcODwNOZj9HDjpoDm2
	M5U18WX3IyRt9/eLSHAO3DvOxHe/REEzCIPPWUoiAWaiNlUyVrhTNeuG2YbpcxJ0djEm
	cPNaJu9jAtDOvAHsz911km+KvQWxWnLOvQpZE=
Received: by 10.223.108.196 with SMTP id g4mr875644fap.36.1228607512874;
	Sat, 06 Dec 2008 15:51:52 -0800 (PST)
Received: by 10.223.115.200 with HTTP; Sat, 6 Dec 2008 15:51:52 -0800 (PST)
Message-ID: <c384c5ea0812061551j27c4e7eagb10e01f64d9e8668@mail.gmail.com>
Date: Sun, 7 Dec 2008 00:51:52 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
Subject: BUG? Some files in the build end up without read permission (mostly in .pc/)
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
X-List-Received-Date: Sat, 06 Dec 2008 23:55:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,


I have noticed (for long) that some files in the build end up without
read permission.
I wonder if this is a local problem, something desired for some
reason, or a global problem?

Could anyone run this on their TMPDIR please, to verify it is not a
local problem:

find tmp -type f -perm 000

or better if you have the disk space:

cp -a tmp tmp2


Regards,
-- 
Leon


