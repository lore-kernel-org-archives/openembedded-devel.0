Received: from [17.148.16.94] (helo=asmtpout019.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MIFCK-0003A3-Oi
	for openembedded-devel@lists.openembedded.org;
	Sun, 21 Jun 2009 07:02:33 +0200
MIME-version: 1.0
Received: from [87.201.169.70] by asmtp019.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KLK00D8DO5W4O90@asmtp019.mac.com> for
	openembedded-devel@lists.openembedded.org; Sat,
	20 Jun 2009 21:51:41 -0700 (PDT)
Message-id: <303EC8BA-C422-4EE2-B122-8EE9B648C834@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: OpenEmbedded Developers <openembedded-devel@lists.openembedded.org>
Date: Sun, 21 Jun 2009 08:51:16 +0400
X-Mailer: Apple Mail (2.935.3)
Subject: How to change $(CC) to use g++ version
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
X-List-Received-Date: Sun, 21 Jun 2009 05:02:33 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=US-ASCII; format=flowed; delsp=yes

Hi,
	How can I change my compiler from gcc to g++ in an OE recipe?

For example,

do_compile () {
    ${CC} ${CFLAGS} ${LDFLAGS} ${WORKDIR}/read_port.cpp -o libserial- 
test-read-port
}

here CC should be calling the g++ version of the arm-g++ compiler.

Best regards,

Elvis




