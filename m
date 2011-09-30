Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bluelotus256@gmail.com>) id 1R9fmN-0005ZO-Vg
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Sep 2011 18:17:40 +0200
Received: by bke11 with SMTP id 11so1947715bke.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Sep 2011 09:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=80dUylF2KQxSzyPiPsgqb8PuUd94Rk5LufuNL3xjDf0=;
	b=DsmjSRYpBOe3RVP6tn+hc5wcoKIwMqVes8xhqqu8qGSq2OMUKeuzutasmKt9n6mGpw
	GvhpdKQk234tg5BWYRg2waYtZp8S/1L3eCZQLLMdfYYN82mH+42/OUFWlkDyugNlcyyR
	Fu5SRGRJcnqQdH5Nc14Xf6lgyG6jgMwzxo3tI=
MIME-Version: 1.0
Received: by 10.204.131.198 with SMTP id y6mr8183985bks.330.1317399130823;
	Fri, 30 Sep 2011 09:12:10 -0700 (PDT)
Received: by 10.205.83.6 with HTTP; Fri, 30 Sep 2011 09:12:10 -0700 (PDT)
Date: Fri, 30 Sep 2011 10:12:10 -0600
Message-ID: <CAFkhdsekLmcser0W9K5Rj+Q4sLx_1sxWGikYZ+XJUW+h9uYO0g@mail.gmail.com>
From: asdfasdf asdfasdf <bluelotus256@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Question regarding a bitbake recipe for libmodbus
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
X-List-Received-Date: Fri, 30 Sep 2011 16:17:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi
     hope you are doing well. I  am using a ARM based development
platform.I would appreciate it if you could answer a question I have
with regard to a
bitbake recipe for libmodbus:

I am trying to communicate with a plc which is a modbus slave through a C
program. The program just opens and closes the connection as I basically
wanted to test this function first before I proceeded any further:

# include "stdio.h"
# include "stdlib.h"
# include "modbus/modbus.h"

#define plc 0x01

int main(void)
{
modbus_param_t mb_param;

modbus_init_rtu(&mb_param,"/dev/ttyS2","none",8,1);

if (modbus_connect(&mb_param) == -1) {
printf("Not connected\n");
exit(1);
}

modbus_close(&mb_param);

}


My bitbake recipe is as follows:

DESCRIPTION = "modbuscomm"
SECTION = "examples"
LICENSE = "GPL"
PR = "r12"

SRC_URI = "file://mymodbuscomm.c \
file://modbus.c \
file://modbus.h \
file://modbus-data.c \
file://modbus-rtu.c \
file://modbus-rtu.h \
file://modbus-tcp.c \
file://modbus-tcp.h"

S = "${WORKDIR}"

do_compile() {
${CC} ${CFLAGS} ${LDFLAGS} mymodbuscomm.c -o mymodbuscomm
${CC} ${CFLAGS} ${LDFLAGS} modbus.c -o modbus
${CC} ${CFLAGS} ${LDFLAGS} modbus-data.c -o modbus-data
${CC} ${CFLAGS} ${LDFLAGS} modbus-rtu.c -o modbus-rtu
${CC} ${CFLAGS} ${LDFLAGS} modbus-tcp.c -o modbus-tcp

}

do_install() {
install -d ${D}${bindir}
install -m 0755 mymodbuscomm ${D}${bindir}
install -m 0755 modbus ${D}${bindir}
install -m 0755 modbus-data ${D}${bindir}
install -m 0755 modbus-rtu ${D}${bindir}
install -m 0755 modbus-tcp ${D}${bindir}
}


I am faced with these errors when I bitbake my application:

Log data follows:
| mymodbuscomm.c: In function 'main':
| mymodbuscomm.c:11: error: 'modbus_param_t' undeclared (first use in this
function)
| mymodbuscomm.c:11: error: (Each undeclared identifier is reported only
once
| mymodbuscomm.c:11: error: for each function it appears in.)
| mymodbuscomm.c:11: error: expected ';' before 'mb_param'
| mymodbuscomm.c:14: error: 'mb_param' undeclared (first use in this
function)
| ERROR: Function do_compile failed


I would very much appreciate it if you could let me know if there is
something wrong with my bitbake recipe or suggest any changes to the recipe.
Thank you and have a great day.

                              Best Regards,
                               JM

