Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-vk0-f49.google.com (mail-vk0-f49.google.com
	[209.85.213.49])
	by mail.openembedded.org (Postfix) with ESMTP id 667C373191
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Dec 2015 22:41:08 +0000 (UTC)
Received: by mail-vk0-f49.google.com with SMTP id j66so55400030vkg.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Dec 2015 14:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=0p8rDvPjgATN9GJ3dw6ri2bn33oQie+56lCJzY52siw=;
	b=BKc9XfHtYHRkbZ/C1Eg/tvD4G1hLfKkN3AGWTzqadB3Mm6h3gIP/SZzUBkDOYscdyU
	59f0gV1j3AEzDjHnDXTrU7ooY3a8rg5Pm5E59N1NbzsIMmJxYW+QxAsupOBfZqP9B+Xa
	pJDWC4EfPmcuwUvn3rP+fl3zExMj00KxN2/0SgoIW78rb9A4b0tDzwydkFQciwWw6+GX
	YE4cIcG96a7q+T6jD+JWJzlcbPF6fscuR27lCmNvQ14F9Zgb0KaDRX40GujMhfHNTSJW
	X/3ExBLdM/Irct3C2lc2B956itxA598/s5tEvXlRo+CvIYO5VlmuhQrfCQiQ99W6XCq5
	QBhg==
X-Received: by 10.31.171.83 with SMTP id u80mr190705vke.104.1450392069049;
	Thu, 17 Dec 2015 14:41:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.166.146 with HTTP; Thu, 17 Dec 2015 14:40:49 -0800 (PST)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Fri, 18 Dec 2015 11:40:49 +1300
Message-ID: <CADySD0EMe7-QMph69tHYL9Trz3AvR6C6vp-KhLisBLWCDnkFwg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Bluetooth agent can't get default adapter
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Dec 2015 22:41:12 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I am trying to use WL1835 bluetooth with AM335x EVM. Software is meta-arago
daisy.

When I run bluetooth agent, I get error  "Can't get default adapter"

Following is the sequence of commands:

root@am335x-evm:~# bluetoothd

root@am335x-evm:~# hciconfig hci0 up

[  944.008593] (stc):  chnl_id list empty :4
[  944.012749] (stk) : st_kim_start(stk) :ldisc_install = 1uim:poll broke
due to event 10(PRI:2/ERR:8)

uim:read 1 from install

uim:@ st_uart_config
uim: signal received, opening /dev/ttyS1
uim:@ set_baud_rate
uim:set_baud_rate() done
uim:Setting speed to 3000000
uim:@ read_command_complete
uim: Command complete started
uim:@ read_hci_event
uim: read_hci_event
uim:Command complete done
[  944.180311] (stc): st_tty_open
uim:Speed changing to 3000000, 1
uim:@ set_custom_baud_rate
(stk) :line discipline installeduim:Installed N_TI_WL Line displine
[  944.194437] (stk) :TIInit_11.8.32.bts
uim:begin polling...
(stk) :change remote baud rate command in firmware
[  944.214516] (stk) :skipping the wait event of change remote baud[
 944.928331] (stc): add_channel_to_table: id 4
[  944.932771] (stc): add_channel_to_table: id 2
[  944.937149] (stc): add_channel_to_table: id 3

root@am335x-evm:~# hcitool scan
Scanning ...
        00:02:72:E3:0F:7F       RS232 Dongle Slave

root@am335x-evm:~# agent hci0 00:02:72:E3:0F:7F
Can't get default adapter
No such adapter

root@am335x-evm:~# dmesg | grep Bluetooth
[    3.475348] Bluetooth: Core ver 2.18
[    3.483613] Bluetooth: HCI device and connection manager initialized
[    3.663793] Bluetooth: HCI socket layer initialized
[    3.668731] Bluetooth: L2CAP socket layer initialized
[    3.814838] Bluetooth: SCO socket layer initialized
[   16.667945] Bluetooth: st_register failed -22

dbus is running and service file is also present

root@am335x-evm:~# cat /usr/share/dbus-1/system-services/org.bluez.service
[D-BUS Service]
Name=org.bluez
Exec=/bin/false
User=root
SystemdService=dbus-org.bluez.service

root@am335x-evm:~# cat /etc/dbus-1/system.d/bluetooth.conf
<!-- This configuration file specifies the required security policies
     for Bluetooth core daemon to work. -->
<!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-BUS Bus Configuration
1.0//EN"
 "<a href="http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
www.freedesktop.org/.../busconfig.dtd"></a>
<busconfig>
  <!-- ../system.conf have denied everything, so we just punch some holes
-->
  <policy user="root">
    <allow own="org.bluez"/>
    <allow send_destination="org.bluez"/>
    <allow send_interface="org.bluez.Agent"/>
    <allow send_interface="org.bluez.PasskeyAgent"/>
  </policy>

  <policy context="default">
    <allow own="org.bluez"/>
    <allow send_destination="org.bluez"/>
    <allow send_interface="org.bluez.Agent"/>
  </policy>

</busconfig>


When I run bluetoothd, I can see org.bluez in dbus list

root@am335x-evm:~# dbus-send --system --dest=org.freedesktop.DBus
--type=method_call --print-reply /org/freedesktop/DBus
org.freedesktop.DBus.ListNames
method return sender=org.freedesktop.DBus -> dest=:1.4 reply_serial=2
   array [
      string "org.freedesktop.DBus"
      string ":1.4"
      string ":1.0"
      string "org.bluez"
   ]

But when I query default adapter, I don't get a response

root@am335x-evm:~# dbus-send --system --print-reply --dest=org.bluez /
org.bluez.Manager.ListAdapters
method return sender=:1.0 -> dest=:1.5 reply_serial=2
   array [
   ]

What's missing to get it working ? Any help is appreciated

Thanks
Ankur

