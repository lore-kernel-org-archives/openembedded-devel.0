Received: from [74.125.92.150] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1LKCV9-0002P6-40
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Jan 2009 15:01:47 +0100
Received: by qw-out-1920.google.com with SMTP id 14so3192665qwa.36
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Jan 2009 05:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type:content-transfer-encoding
	:content-disposition;
	bh=ikczJjRckA6hj3Yq6Aoqbn8pNthw/mv4j5et5Dpt2ds=;
	b=hFL/a3BOpTWAGLlS99f9qfUy6pQINvu70Wgv74bHSWD2U6BuHc07Vg6VCzktDCE7mz
	maKxobq6iD8n7uL0b49mxp2FCm29MTzAAE55aqtfAs6/erpOSpT4WuW7c2Io/n2fqfSn
	uDWg+QbDW74hswNyISftV3VPmBUGSQnumlMCc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type
	:content-transfer-encoding:content-disposition;
	b=jobEHiBl86U8S/EswFk9+t+xpEWmg+sB0Nmn2IZSnVK2uVHZY4VnfqAD5AwMZbF/el
	RyqumMt45bY8yX5BZ9E6vvWEeD7yo+CC4JjZTrzIXRp8lepPRlsIFp+Qy8PYp2a3XJe5
	wrC2QfHYiMVw8f142Su3XZgxyNh1tP6/OJzSA=
Received: by 10.215.13.1 with SMTP id q1mr3635565qai.253.1231250146721;
	Tue, 06 Jan 2009 05:55:46 -0800 (PST)
Received: by 10.215.66.18 with HTTP; Tue, 6 Jan 2009 05:55:46 -0800 (PST)
Message-ID: <c384c5ea0901060555t34d7132pbab85d42f7627d9d@mail.gmail.com>
Date: Tue, 6 Jan 2009 14:55:46 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: Changes to udhcpd script to not deconfigure interfaces underneath NFS root mounts. (#4962)
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
X-List-Received-Date: Tue, 06 Jan 2009 14:01:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

In git .dev, I have committed a change to the udhcpd script to not
deconfigure an interface if the rootfs is running over NFS (or some
other network mounted fs).

This should be robust and fail-safe. But as it's quite intrusive, this
email is for the records.

http://bugs.openembedded.net/show_bug.cgi?id=4962


# return 0 if root is mounted on a network filesystem
root_is_nfs() {
        grep -qe '^/dev/root.*\(nfs\|smbfs\|ncp\|coda\) .*' /proc/mounts
}

case "$1" in
        deconfig)
                if [ ! root_is_nfs ]; then
                        /sbin/ifconfig $interface 0.0.0.0
                fi
                ;;

Regards,
-- 
Leon


