Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pbzss-0002Si-Aq
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 Jan 2011 19:20:54 +0100
Received: by pwi8 with SMTP id 8so2678307pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Jan 2011 10:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=QJ+aPJbynRKHFPgR01TcBA1XE6LwvF3sNcx3AWHrzag=;
	b=Zv2msky4S4jXRUXPDCRBlPA+8zGRtUqVwRbKncMEHfcXsJheFZgfNkIlM3LBaz1CiU
	fTSC4R2ovfXclFaHdmw7qWE9dVJXoARvMJi0Zh51h9nDblNH6wkPpQaKybeGaK8JmtP7
	EMWjRt3P8KdMX39X0MCQ+3En1jLGRMGLa3rjo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=uAOSxKwlq7ZQ7WsAUiJTSTAbG7pwFpZUoMvWyMtWCjYM3I5dBMwIEkzHWZ9/v4v9u4
	U5DQ3f91a0NrQer6RCjQqbQdBeAW2wS8LFuABkQnCbiuRYGD+OyPLt0CJeONCXmrm+Aa
	MVY7pP4tBTGkZl2tdjUhZ0OEDSa0tdSU+emNM=
Received: by 10.142.186.15 with SMTP id j15mr3647188wff.11.1294597224163;
	Sun, 09 Jan 2011 10:20:24 -0800 (PST)
Received: from [192.168.1.68] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id w14sm6394309wfd.6.2011.01.09.10.20.22
	(version=SSLv3 cipher=RC4-MD5); Sun, 09 Jan 2011 10:20:23 -0800 (PST)
Message-ID: <4D29FC65.9010608@gmail.com>
Date: Sun, 09 Jan 2011 10:20:21 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.13) Gecko/20101207 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1294585014.4036.47.camel@mattotaupa>
In-Reply-To: <1294585014.4036.47.camel@mattotaupa>
Subject: Re: libcap_1.10: ERROR: QA Issue with libcap: non -dev package contains symlink .so
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
X-List-Received-Date: Sun, 09 Jan 2011 18:20:54 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/9/2011 6:56 AM, Paul Menzel wrote:
> Dear OE folks,
>
>
> doing `bitbake -k libcap` with latest master (3d030f) with
> `minimal-uclibc` for `MACHINE = "beagleboard"`
>
>          NOTE: package libcap-1.10-r2: task do_qa_staging: Succeeded
>          ERROR: QA Issue with libcap: non -dev package contains symlink .so: libcap path '/work/armv7a-oe-linux-uclibceabi/libcap-1.10-r2/packages-split/libcap/usr/lib/libcap.so'
>          ERROR: QA Issue with libcap: non -dev package contains symlink .so: libcap path '/work/armv7a-oe-linux-uclibceabi/libcap-1.10-r2/packages-split/libcap/usr/lib/libcap.so'
>          NOTE: package libcap-1.10-r2: task do_package: Succeeded
>
> Is that error reasonable or are library packages not allowed to have
> symlinks [1]?

Usually sylinks are needed for debugging and linking thats why its 
preferred in -dev packages. But you can sort it out by removing the 
below lines and see how the automatic package puts stuff

>
>          FILES_${PN} = "${libdir}"
>          FILES_${PN}-dev = "${includedir}"
>
>
> Thanks,
>
> Paul
>
>
> [1] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/libcap/libcap_1.10.bb?id=3d030ffa57af27275fbb42eaa0fcd611f4925348
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



